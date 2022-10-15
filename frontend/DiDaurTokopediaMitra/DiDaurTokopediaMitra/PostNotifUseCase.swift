//
//  PostItemUseCase.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation
import RxSwift

public struct PostNotifUseCaseRequest {
}

public protocol PostNotifUseCase {
    func execute(_ request: PostNotifUseCaseRequest) -> Observable<ApiResult<SuccessResponseDomain?,ErrorResponseDomain>>
}

public final class DefaultPostNotifUseCase {

    private let repository: UserResourceRepository
    
    init(repository: UserResourceRepository) {
        self.repository = repository
    }

}

extension DefaultPostNotifUseCase: PostNotifUseCase {
    
    public func execute(_ request: PostNotifUseCaseRequest) -> Observable<ApiResult<SuccessResponseDomain?, ErrorResponseDomain>> {
        return self.repository.postNotif()
    }
    
}
