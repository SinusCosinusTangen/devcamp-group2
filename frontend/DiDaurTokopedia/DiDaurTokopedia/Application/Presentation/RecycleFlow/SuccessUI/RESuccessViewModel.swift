//
//  RESuccessViewModel.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import Foundation

// MARK: RESuccessViewModelResponse
public enum RESuccessViewModelResponse {
}

// MARK: RESuccessViewModelDelegate
public protocol RESuccessViewModelDelegate: AnyObject {
}

// MARK: - RESuccessViewModelRequestValue
public struct RESuccessViewModelRequestValue {
}

// MARK: - RESuccessViewModelRoute
public struct RESuccessViewModelRoute {
    var start: (_ instructor: RecycleFlowCoordinatorInstructor) -> Void
}

// MARK: - RESuccessViewModelInput
public protocol RESuccessViewModelInput {
    func viewDidLoad()
    func didClickedDoneButton()
}

// MARK: - RESuccessViewModelOutput
public protocol RESuccessViewModelOutput {
}

// MARK: - RESuccessViewModel
public protocol RESuccessViewModel: RESuccessViewModelInput, RESuccessViewModelOutput { }

// MARK: - DefaultRESuccessViewModel
public final class DefaultRESuccessViewModel: RESuccessViewModel {

    // MARK: Dependency Variable
    weak var delegate: RESuccessViewModelDelegate?
    let requestValue: RESuccessViewModelRequestValue
    let route: RESuccessViewModelRoute

    // MARK: Output ViewModel Variable

    init(
        requestValue: RESuccessViewModelRequestValue,
        route: RESuccessViewModelRoute
    ) {
        self.requestValue = requestValue
        self.route = route
    }

}

// MARK: Input ViewModel Function
public extension DefaultRESuccessViewModel {

    func viewDidLoad() {
    }
    
    func didClickedDoneButton() {
        self.route.start(.dashboard)
    }

}

// MARK: Private Function
private extension DefaultRESuccessViewModel {

}
