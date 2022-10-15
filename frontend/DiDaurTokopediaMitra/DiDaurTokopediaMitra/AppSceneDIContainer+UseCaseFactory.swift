//
//  AppSceneDIContainer+UseCaseFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

extension AppSceneDIContainer: UseCaseFactory {
    func makeFetchUserUseCase() -> FetchUserUseCase {
        return DefaultFetchUserUseCase(repository: self.userResourceRepository)
    }
    func makeFetchListUseCase() -> FetchListUseCase {
        return DefaultFetchListUseCase(repository: self.userResourceRepository)
    }
    func makePostItemUseCase() -> PostItemUseCase {
        return DefaultPostItemUseCase(repository: self.userResourceRepository)
    }
    func makePostNotifUseCase() -> PostNotifUseCase {
        return DefaultPostNotifUseCase(repository: self.userResourceRepository)
    }
}
