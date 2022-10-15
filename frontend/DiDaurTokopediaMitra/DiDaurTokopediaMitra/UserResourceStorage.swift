//
//  UserResourceStorage.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation
import RxSwift

public protocol UserResourceStorage {
    func fetchUser() -> Observable<ApiResult<DaurEndpoint.FetchUserDTO.Response.Body?,ErrorResponseDomain>>
    func fetchList() -> Observable<ApiResult<DaurEndpoint.FetchListDTO.Response.Body?,ErrorResponseDomain>>
    func postItem(wasteId: Int, weight: Int) -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
    func postNotif() -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
}

public class DefaultUserResourceStorage {
    
    private let service: NetworkServiceProtocol
    
    init (service: NetworkServiceProtocol) {
        self.service = service
    }
    
}

extension DefaultUserResourceStorage: UserResourceStorage {
    
    public func fetchUser() -> Observable<ApiResult<DaurEndpoint.FetchUserDTO.Response.Body?, ErrorResponseDomain>> {
        let request = URLRequestBuilder(baseURL: DaurEndpoint.FetchUserDTO.url, path: "", method: .get)

        return self.service.sendRequest(with: request.build(), for: DaurEndpoint.FetchUserDTO.Response.Body.self)
    }
    public func fetchList() -> Observable<ApiResult<DaurEndpoint.FetchListDTO.Response.Body?, ErrorResponseDomain>> {
        let request = URLRequestBuilder(baseURL: DaurEndpoint.FetchListDTO.url, path: "", method: .get)
        return self.service.sendRequest(with: request.build(), for: DaurEndpoint.FetchListDTO.Response.Body.self)
    }
    
    public func postItem(wasteId: Int, weight: Int) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        let parameter = DaurEndpoint.PostItemDTO.Request.Parameter(wasteId: wasteId, weight: weight).get()
        let request = URLRequestBuilder(baseURL: DaurEndpoint.PostNotifDTO.url, path: "", method: .get)
        request.addParameter(parameter)
        
        return self.service.sendRequest(with: request.build())
    }
    
    public func postNotif() -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        let request = URLRequestBuilder(baseURL: DaurEndpoint.PostNotifDTO.url, path: "", method: .get)
        return self.service.sendRequest(with: request.build())
    }
    
}

