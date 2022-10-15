//
//  NetworkService.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//
import Alamofire
import RxSwift
import UIKit
import RxAlamofire
import Alamofire

public protocol NetworkServiceProtocol {
    
    func sendRequest<T: Codable>(with request: URLRequestConvertible,for responseBody: T.Type) -> Observable<ApiResult<T?, ErrorResponseDomain>>
    func sendRequest<T: Codable>(with request: URLRequestConvertible,for responseBody: [T].Type) -> Observable<ApiResult<[T]?, ErrorResponseDomain>>
    func sendRequest<Data: Codable>(with request: URLRequestConvertible, for responseBody: Data.Type) -> Observable<ApiResult<Data, ErrorResponseDomain>>
    func sendRequest(with request: URLRequestConvertible) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>>
    
}

public final class NetworkService {
    
    public static let shared: NetworkServiceProtocol = NetworkService()
    lazy var session: Session = {
        let session = Session(configuration: self.sessionConfiguration, eventMonitors: [NetworkLogger()])
        return session
    }()
    lazy var sessionConfiguration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 200
        configuration.timeoutIntervalForRequest = 200
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return configuration
    }()
    
    private init() {}
    
}

extension NetworkService: NetworkServiceProtocol {

    public func sendRequest<T: Codable>(with request: URLRequestConvertible,for responseBody: T.Type) -> Observable<ApiResult<T?, ErrorResponseDomain>> {
        return self.session.rx
                    .request(urlRequest: request)
                    .validate(statusCode: 200..<300)
                    .responseData()
                    .decode(responseType: responseBody)
    }
    
    public func sendRequest<T: Codable>(with request: URLRequestConvertible, for responseBody: [T].Type) -> Observable<ApiResult<[T]?, ErrorResponseDomain>>  {
        return self.session.rx
                    .request(urlRequest: request)
                    .validate(statusCode: 200..<300)
                    .responseData()
                    .decode(responseType: responseBody)
    }
    
    public func sendRequest(with request: URLRequestConvertible) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        return self.session.rx
                    .request(urlRequest: request)
                    .response()
                    .flatMap { response -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> in
                        var observable: Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> = Observable.just(ApiResult.success(nil))
                        switch response.statusCode {
                        case 200..<300:
                            let successResponse = SuccessResponseDomain(status: 200, message: "Success")
                            observable = Observable.just(ApiResult.success(successResponse))
                        default:
                            let error = NSError.create(with: "Unable to perform request", code: 500)
                            observable = Observable.error(error)
                        }
                        return observable
                    }
    }
    
    public func sendRequest<Data: Codable>(with request: URLRequestConvertible, for response: Data.Type) -> Observable<ApiResult<Data, ErrorResponseDomain>>  {
        return self.session.rx
                    .request(urlRequest: request)
                    .validate(statusCode: 200..<300)
                    .responseData()
                    .decode(responseType: response)
    }
    
}

public extension Observable where Element == (HTTPURLResponse, Data) {
    
    func decode<Data: Codable>(responseType: Data.Type) -> Observable<ApiResult<Data, ErrorResponseDomain>> {
        return self.map { (httpResponse, data) -> ApiResult<Data, ErrorResponseDomain> in
            switch httpResponse.statusCode{
            case 200..<300:
                var object: Data?
                if !data.isEmpty {
                    object = data as? Data
                }
                return .success(object!)
            default:
                let apiErrorMessage: ErrorResponseDomain
                do {
                    apiErrorMessage = try JSONDecoder().decode(ErrorResponseDomain.self, from: data)
                } catch _ {
                    apiErrorMessage = ErrorResponseDomain(status: 500, message: .CommonString.commonError, errorCode: 12, timestamp: 0, details: [.CommonString.commonError])
                }
                return .failure(apiErrorMessage)
            }
        }
    }
    
    func decode<T: Codable>(responseType: T.Type) -> Observable<ApiResult<T?, ErrorResponseDomain>> {
        return self.map { (httpResponse, data) -> ApiResult<T?, ErrorResponseDomain> in
            switch httpResponse.statusCode{
            case 200..<300:
                var object: T? = nil
                if !data.isEmpty {
                    object = try? JSONDecoder().decode(responseType.self, from: data)
                }
                return .success(object)
            default:
                let apiErrorMessage: ErrorResponseDomain
                do {
                    apiErrorMessage = try JSONDecoder().decode(ErrorResponseDomain.self, from: data)
                } catch _ {
                    apiErrorMessage = ErrorResponseDomain(status: 500, message: .CommonString.commonError, errorCode: 12, timestamp: 0, details: [.CommonString.commonError])
                }
                return .failure(apiErrorMessage)
            }
        }
    }
    
    func decode<T: Codable>(responseType: [T].Type) -> Observable<ApiResult<[T]?, ErrorResponseDomain>> {
        return self.map { (httpResponse, data) -> ApiResult<[T]?, ErrorResponseDomain> in
            switch httpResponse.statusCode{
            case 200..<300:
                var object: [T]? = nil
                if !data.isEmpty {
                    object = try? JSONDecoder().decode(responseType.self, from: data)
                }
                return .success(object)
            default:
                let apiErrorMessage: ErrorResponseDomain
                do {
                    apiErrorMessage = try JSONDecoder().decode(ErrorResponseDomain.self, from: data)
                } catch _ {
                    apiErrorMessage = ErrorResponseDomain(status: 500, message: .CommonString.commonError, errorCode: 12, timestamp: 0, details: [.CommonString.commonError])
                }
                return .failure(apiErrorMessage)
            }
        }
    }
    
}

extension NetworkService {
    
    private func returnData(_ data: Data, type: String) -> Data {
        switch type {
        case "png":
            let image = UIImage(data: data)!
            return image.pngData() ?? data
        case "jpg":
            let image = UIImage(data: data)!
            return image.jpegData(compressionQuality: 0.5) ?? data
        default:
            return data
        }
    }
}
