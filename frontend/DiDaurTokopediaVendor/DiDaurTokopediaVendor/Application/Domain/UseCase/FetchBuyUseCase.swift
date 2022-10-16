//
//  FetchUserUseCaseUseCase.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import RxSwift

public struct FetchBuyUseCaseRequest {
    var tpsId: Int
    var weight: Int
}

public protocol FetchBuyUseCase {
    func execute(_ request: FetchBuyUseCaseRequest) -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
}

public final class DefaultFetchBuyUseCase {

    private let repository: UserResourceRepository
    
    init(repository: UserResourceRepository) {
        self.repository = repository
    }

}

extension DefaultFetchBuyUseCase: FetchBuyUseCase {
    public func execute(_ request: FetchBuyUseCaseRequest) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        return self.repository.fetchBuy(tpsId: request.tpsId, weight: request.weight)
    }
    
}
