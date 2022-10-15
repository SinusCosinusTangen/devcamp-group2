//
//  RepositoryFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

protocol RepositoryFactory {
    func makeUserResourceRepository() -> UserResourceRepository
}
