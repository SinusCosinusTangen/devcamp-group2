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
    func postItem(id: Int) -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
}

public class DefaultUserResourceStorage {
    
    private let service: NetworkServiceProtocol
    
    init (service: NetworkServiceProtocol) {
        self.service = service
    }
    
}

extension DefaultUserResourceStorage: UserResourceStorage {
    
    public func fetchUser() -> Observable<ApiResult<DaurEndpoint.FetchUserDTO.Response.Body?,ErrorResponseDomain>> {
        let request = URLRequestBuilder(baseURL: DaurEndpoint.FetchUserDTO.url, path: "", method: .get)

        return self.service.sendRequest(with: request.build(), for: DaurEndpoint.FetchUserDTO.Response.Body.self)
    }
    
    public func postItem(id: Int) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        let request = URLRequestBuilder(baseURL: DaurEndpoint.PostItemDTO.getURL(id: id), path: "", method: .get)
        return self.service.sendRequest(with: request.build())
    }
}

