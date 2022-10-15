//
//  AppSceneDIContainer+RepositoryFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

extension AppSceneDIContainer: RepositoryFactory {
    func makeUserResourceRepository() -> UserResourceRepository {
        return DefaultUserResourceRepository(storage: self.userResourceStorage)
    }
}
