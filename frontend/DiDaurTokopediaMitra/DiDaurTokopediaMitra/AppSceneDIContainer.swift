//
//  AppSceneDIContainer.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.
//

import Foundation
import UIKit

typealias PresentationFactory = FlowCoordinatorFactory & ViewControllerFactory
typealias ViewControllerFactory = RecycleFlowCoordinatorFactory

final class AppSceneDIContainer {
    
    let navigationController: UINavigationController
    
    // MARK: Service
    lazy var networkService: NetworkServiceProtocol = NetworkService.shared

    // MARK: Storage
    lazy var userResourceStorage = DefaultUserResourceStorage(service: self.networkService)

    // MARK: Repository
    lazy var userResourceRepository = DefaultUserResourceRepository(storage: self.userResourceStorage)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
