//
//  UserResourceRepository.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation
import RxSwift

protocol UserResourceRepository {
    func fetchUser() -> Observable<ApiResult<FetchUserDomain?,ErrorResponseDomain>>
    func postItem(id: Int) -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
}

public class DefaultUserResourceRepository {
    private let storage: UserResourceStorage
    
    public init(storage: UserResourceStorage) {
        self.storage = storage
    }
}

extension DefaultUserResourceRepository: UserResourceRepository {
    func fetchUser() -> Observable<ApiResult<FetchUserDomain?,ErrorResponseDomain>> {
        return self.storage.fetchUser().flatMap { observable -> Observable<ApiResult<FetchUserDomain?, ErrorResponseDomain>> in
            switch observable {
            case .success(let response):
                guard let response = response else { return .just(.success(nil))}
                return .just(.success(response.toDomain()))
            case .failure(let error):
                return .just(.failure(error))
            }
        }
    }
    
    func postItem(id: Int) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        return self.storage.postItem(id: id)
    }
}
