//
//  AppSceneDIContainer+RecycleFlowCoordinatorFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

extension AppSceneDIContainer: RecycleFlowCoordinatorFactory {
    func makeREDashboardController(requestValue: REDashboardViewModelRequestValue, route: REDashboardViewModelRoute) -> REDashboardController {
        let viewModel = DefaultREDashboardViewModel(requestValue: requestValue, route: route, fetchUserUseCase: self.makeFetchUserUseCase())
        return REDashboardController.create(with: viewModel)
    }
    
    func makeREConfirmController(requestValue: REConfirmViewModelRequestValue, route: REConfirmViewModelRoute) -> REConfirmController {
        let viewModel = DefaultREConfirmViewModel(requestValue: requestValue, route: route, postItemUseCase: self.makePostItemUseCase())
        return REConfirmController.create(with: viewModel)
    }
    
    func makeRESuccessController(requestValue: RESuccessViewModelRequestValue, route: RESuccessViewModelRoute) -> RESuccessController {
        let viewModel = DefaultRESuccessViewModel(requestValue: requestValue, route: route)
        return RESuccessController.create(with: viewModel)
    }
}
