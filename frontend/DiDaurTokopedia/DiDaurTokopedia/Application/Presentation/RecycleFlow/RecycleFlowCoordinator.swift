//
//  RecycleFlowCoordinator.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.
//

import UIKit

// MARK: RecycleFlowCoordinatorFactory
public protocol RecycleFlowCoordinatorFactory  {
    func makeREDashboardController(
        requestValue: REDashboardViewModelRequestValue,
        route: REDashboardViewModelRoute
    ) -> REDashboardController
    
    func makeREConfirmController(
        requestValue: REConfirmViewModelRequestValue,
        route: REConfirmViewModelRoute
    ) -> REConfirmController
    
    func makeRESuccessController(
        requestValue: RESuccessViewModelRequestValue,
        route: RESuccessViewModelRoute
    ) -> RESuccessController
}

// MARK: RecycleFlowCoordinator
public protocol RecycleFlowCoordinator {
    func start(with instructor: RecycleFlowCoordinatorInstructor)
}

// MARK: RecycleFlowCoordinatorInstructor
public enum RecycleFlowCoordinatorInstructor {
    case dashboard
    case confirm(requestValue: REConfirmViewModelRequestValue)
    case success(requestValue: RESuccessViewModelRequestValue)
}

// MARK: DefaultRecycleFlowCoordinator
final class DefaultRecycleFlowCoordinator {

    // MARK: DI Variable
    let navigationController: UINavigationController
    let flowCoordinatorFactory: FlowCoordinatorFactory
    let viewControllerFactory: RecycleFlowCoordinatorFactory

    // MARK: Init Funciton
    public init(
        navigationController: UINavigationController,
        factory: PresentationFactory
    ) {
        self.navigationController = navigationController
        self.flowCoordinatorFactory = factory
        self.viewControllerFactory = factory
    }
    
}

extension DefaultRecycleFlowCoordinator: RecycleFlowCoordinator {
    
    public func start(with instructor: RecycleFlowCoordinatorInstructor) {
        switch instructor {
        case .dashboard:
            let vc = initREDashboardController()
            self.navigationController.pushViewController(vc, animated: true)
        case .confirm(let requestValue):
            let vc = initREConfirmController(requestValue: requestValue)
            self.navigationController.pushViewController(vc, animated: true)
        case .success(let requestValue):
            let vc = initRESuccessController(requestValue: requestValue)
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}

private extension DefaultRecycleFlowCoordinator {
    func startRecycleFlow(_ instructor: RecycleFlowCoordinatorInstructor) {
        DispatchQueue.main.async {
            self.flowCoordinatorFactory.instantiateRecycleFlowCoordinator().start(with: instructor)
        }
    }
}

private extension DefaultRecycleFlowCoordinator {
    func initREDashboardController() -> REDashboardController {
        let requestValue = REDashboardViewModelRequestValue()
        let route = REDashboardViewModelRoute(start: self.startRecycleFlow(_:))
        return self.viewControllerFactory.makeREDashboardController(requestValue: requestValue, route: route)
    }
    
    func initREConfirmController(requestValue: REConfirmViewModelRequestValue) -> REConfirmController {
        let route = REConfirmViewModelRoute(start: self.startRecycleFlow(_:))
        return self.viewControllerFactory.makeREConfirmController(requestValue: requestValue, route: route)
    }
    
    func initRESuccessController(requestValue: RESuccessViewModelRequestValue) -> RESuccessController {
        let route = RESuccessViewModelRoute(start: self.startRecycleFlow(_:))
        return self.viewControllerFactory.makeRESuccessController(requestValue: requestValue, route: route)
    }
}
