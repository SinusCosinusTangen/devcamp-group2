//
//  REDashboardViewModel.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import Foundation
import RxSwift
import RxRelay

// MARK: REDashboardViewModelResponse
public enum REDashboardViewModelResponse {
}

// MARK: REDashboardViewModelDelegate
public protocol REDashboardViewModelDelegate: AnyObject {
}

// MARK: - REDashboardViewModelRequestValue
public struct REDashboardViewModelRequestValue {
}

// MARK: - REDashboardViewModelRoute
public struct REDashboardViewModelRoute {
    var start: (_ instructor: RecycleFlowCoordinatorInstructor) -> Void
}

// MARK: - REDashboardViewModelInput
public protocol REDashboardViewModelInput {
    func viewDidLoad()
    func didClickedRecycleButton(id: Int)
}

// MARK: - REDashboardViewModelOutput
public protocol REDashboardViewModelOutput {
    var userDetail: PublishRelay<FetchUserDomain> { get set }
}

// MARK: - REDashboardViewModel
public protocol REDashboardViewModel: REDashboardViewModelInput, REDashboardViewModelOutput { }

// MARK: - DefaultREDashboardViewModel
public final class DefaultREDashboardViewModel: REDashboardViewModel {

    private let disposeBag = DisposeBag()
    // MARK: Dependency Variable
    weak var delegate: REDashboardViewModelDelegate?
    let requestValue: REDashboardViewModelRequestValue
    let route: REDashboardViewModelRoute

    // MARK: UseCase Variable
    private let fetchUserUseCase: FetchUserUseCase
    
    // MARK: Output ViewModel Variable
    public var userDetail = PublishRelay<FetchUserDomain>()
    
    init(
        requestValue: REDashboardViewModelRequestValue,
        route: REDashboardViewModelRoute,
        fetchUserUseCase: FetchUserUseCase
    ) {
        self.requestValue = requestValue
        self.route = route
        self.fetchUserUseCase = fetchUserUseCase
    }

}

// MARK: Input ViewModel Function
public extension DefaultREDashboardViewModel {

    func viewDidLoad() {
        self.doFetchUserUseCase()
    }
    
    func didClickedRecycleButton(id: Int) {
        let requestValue = REConfirmViewModelRequestValue(id: id)
        self.route.start(.confirm(requestValue: requestValue))
    }

}

// MARK: Private Function
private extension DefaultREDashboardViewModel {
    func doFetchUserUseCase() {
        let requestValue = FetchUserUseCaseRequest()
        
        self.fetchUserUseCase.execute(requestValue).subscribe { [weak self] apiResult in
            guard let self = self else { return }
            switch apiResult {
            case .success(let response):
                guard let response = response else { return }
                if response.exp != UserPreference.shared.xpResult {
                    UserPreference.shared.isWaiting = false
                    UserPreference.shared.xpResult = response.exp
                }
                self.userDetail.accept(response)
            case .failure(let errorDomain):
                let error = NSError.create(with: errorDomain.details?.joined(separator: " ") ?? "Failed to fetch user data")
                print(error)
            }
        } onError: { error in
            print(error)
        }.disposed(by: self.disposeBag)
    }
}
