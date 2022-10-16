//
//  FetchUserUseCaseUseCase.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import RxSwift

public struct FetchUserUseCaseRequest {

}

public protocol FetchUserUseCase {
    func execute(_ request: FetchUserUseCaseRequest) -> Observable<ApiResult<FetchUserDomain?,ErrorResponseDomain>>
}

public final class DefaultFetchUserUseCase {

    private let repository: UserResourceRepository
    
    init(repository: UserResourceRepository) {
        self.repository = repository
    }

}

extension DefaultFetchUserUseCase: FetchUserUseCase {
    
    public func execute(_ request: FetchUserUseCaseRequest) -> Observable<ApiResult<FetchUserDomain?, ErrorResponseDomain>> {
        return self.repository.fetchUser()
    }
    
}
