//
//  AppFlowCoordinator.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.
//

import UIKit

// MARK: AppFlowCoordinator
final class AppFlowCoordinator {
    
    public enum Instructor {
        case dashboard
    }

    // MARK: DI Variable
    private let navigationController: UINavigationController
    private let flowCoordinatorFactory: FlowCoordinatorFactory
    private let useCaseFactory: UseCaseFactory

    // MARK: Init Funciton
    public init(
        navigationController: UINavigationController,
        presentationFactory: PresentationFactory,
        useCaseFactory: UseCaseFactory
    ) {
        self.navigationController = navigationController
        self.flowCoordinatorFactory = presentationFactory
        self.useCaseFactory = useCaseFactory
    }
    
    func start(with instructor: AppFlowCoordinator.Instructor) {
        switch instructor {
        case .dashboard:
            self.showRecycleScene()
        }
    }
    
    func showRecycleScene() {
        DispatchQueue.main.async {
            self.flowCoordinatorFactory.instantiateRecycleFlowCoordinator().start(with: .dashboard)
        }
    }

}
