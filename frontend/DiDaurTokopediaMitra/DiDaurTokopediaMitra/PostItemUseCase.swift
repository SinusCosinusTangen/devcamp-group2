//
//  PostItemUseCase.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation
import RxSwift

public struct PostItemUseCaseRequest {
    var wasteId: Int
    var weight: Int
}

public protocol PostItemUseCase {
    func execute(_ request: PostItemUseCaseRequest) -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
}

public final class DefaultPostItemUseCase {

    private let repository: UserResourceRepository
    
    init(repository: UserResourceRepository) {
        self.repository = repository
    }

}

extension DefaultPostItemUseCase: PostItemUseCase {
    
    public func execute(_ request: PostItemUseCaseRequest) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        return self.repository.postItem(wasteId: request.wasteId, weight: request.weight)
    }
    
}
