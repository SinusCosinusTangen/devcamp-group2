//
//  URLRequestBuilder.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//
import Alamofire
import Foundation

class URLRequestBuilder {
    
    private(set) var baseURL: URL
    private(set) var path: String
    private(set) var method: HTTPMethod?
    private(set) var headers: [String: String] = [:]
    private(set) var body: [String: Any] = [:]
    private(set) var parameters: [String: String] = [:]
    
    init(baseURL: String, path: String, method: HTTPMethod) {
        self.baseURL = URL(string: baseURL)!
        self.path = path
        self.method = method
    }
    
    public func addHeader(_ headers: [String: String]) {
        self.headers = headers
    }
    
    public func addBody(_ body: [String: Any]) {
        self.body = body
    }
    
    public func addParameter(_ parameters: [String: Any]) {
        self.parameters = parameters.mapValues { String(describing: $0) }
    }
    
    func build() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(string: url.absoluteString)
        var componentTemp = components
        if !self.parameters.isEmpty {
            componentTemp?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        components?.percentEncodedQuery = componentTemp?.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        var urlRequest = URLRequest(url: components!.url!)
        urlRequest.httpMethod = method?.rawValue
        
        for header in headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if method != .get {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            urlRequest.httpBody = jsonData
        }
        
        return urlRequest
        
    }
    
    func buildWithoutURLComponents() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method?.rawValue
        
        for header in headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return urlRequest
    }
    
}
