//
//  AppSceneDIContainer+FlowCoordinatorFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

extension AppSceneDIContainer: FlowCoordinatorFactory {
    
    func instantiateRecycleFlowCoordinator() -> RecycleFlowCoordinator {
        return DefaultRecycleFlowCoordinator(navigationController: self.navigationController, factory: self)
    }
    
}
