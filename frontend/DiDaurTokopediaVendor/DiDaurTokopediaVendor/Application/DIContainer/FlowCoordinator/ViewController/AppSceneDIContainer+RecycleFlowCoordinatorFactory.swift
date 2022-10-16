//
//  AppSceneDIContainer+RecycleFlowCoordinatorFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

extension AppSceneDIContainer: RecycleFlowCoordinatorFactory {
    func makeREDashboardController(requestValue: REDashboardViewModelRequestValue, route: REDashboardViewModelRoute) -> REDashboardController {
        let viewModel = DefaultREDashboardViewModel(requestValue: requestValue, route: route, fetchUserUseCase: self.makeFetchUserUseCase(), fetchListUseCase: self.makeFetchListUseCase())
        return REDashboardController.create(with: viewModel)
    }
    
    func makeREConfirmController(requestValue: REConfirmViewModelRequestValue, route: REConfirmViewModelRoute) -> REConfirmController {
        let viewModel = DefaultREConfirmViewModel(requestValue: requestValue, route: route)
        return REConfirmController.create(with: viewModel)
    }
    
    func makeRESuccessController(requestValue: RESuccessViewModelRequestValue, route: RESuccessViewModelRoute) -> RESuccessController {
        let viewModel = DefaultRESuccessViewModel(requestValue: requestValue, route: route)
        return RESuccessController.create(with: viewModel)
    }
    
    func makeREDetailController(requestValue: REDetailViewModelRequestValue, route: REDetailViewModelRoute) -> REDetailController {
        let viewModel = DefaultREDetailViewModel(requestValue: requestValue, route: route)
        return REDetailController.create(with: viewModel)
    }
}
