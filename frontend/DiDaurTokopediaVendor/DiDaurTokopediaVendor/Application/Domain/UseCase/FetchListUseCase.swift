//
//  FetchUserUseCaseUseCase.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import RxSwift

public struct FetchListUseCaseRequest {
}

public protocol FetchListUseCase {
    func execute(_ request: FetchListUseCaseRequest) -> Observable<ApiResult<FetchListDomain?,ErrorResponseDomain>>
}

public final class DefaultFetchListUseCase {

    private let repository: UserResourceRepository
    
    init(repository: UserResourceRepository) {
        self.repository = repository
    }

}

extension DefaultFetchListUseCase: FetchListUseCase {
    
    public func execute(_ request: FetchListUseCaseRequest) -> Observable<ApiResult<FetchListDomain?, ErrorResponseDomain>> {
        return self.repository.fetchList()
    }
    
}
