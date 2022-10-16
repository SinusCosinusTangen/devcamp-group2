//
//  REDetailViewModel.swift
//  DiDaurTokopediaMitra
//
//  Created by Daffashiddiq on 16/10/22.
//  Copyright (c) 2022 All rights reserved.

import Foundation
import RxSwift

// MARK: REDetailViewModelResponse
public enum REDetailViewModelResponse {
}

// MARK: REDetailViewModelDelegate
public protocol REDetailViewModelDelegate: AnyObject {
}

// MARK: - REDetailViewModelRequestValue
public struct REDetailViewModelRequestValue {
    var result: ResultDomain
}

// MARK: - REDetailViewModelRoute
public struct REDetailViewModelRoute {
    var start: (_ instructor: RecycleFlowCoordinatorInstructor) -> Void
}

// MARK: - REDetailViewModelInput
public protocol REDetailViewModelInput {
    func viewDidLoad()
    func didClickDoneButton(weight: Int)
}

// MARK: - REDetailViewModelOutput
public protocol REDetailViewModelOutput {
    var resultDomain: ResultDomain { get set }
}

// MARK: - REDetailViewModel
public protocol REDetailViewModel: REDetailViewModelInput, REDetailViewModelOutput { }

// MARK: - DefaultREDetailViewModel
public final class DefaultREDetailViewModel: REDetailViewModel {

    // MARK: Dependency Variable
    weak var delegate: REDetailViewModelDelegate?
    let requestValue: REDetailViewModelRequestValue
    let route: REDetailViewModelRoute
    let disposeBag = DisposeBag()

//    private let postItemUseCase: PostItemUseCase
    // MARK: Output ViewModel Variable
    public var resultDomain: ResultDomain
    
    init(
        requestValue: REDetailViewModelRequestValue,
        route: REDetailViewModelRoute
//        postItemUseCase: PostItemUseCase
    ) {
        self.requestValue = requestValue
        self.route = route
//        self.postItemUseCase = postItemUseCase
        self.resultDomain = requestValue.result
    }

}

// MARK: Input ViewModel Function
public extension DefaultREDetailViewModel {

    func viewDidLoad() {
    }
    
    func didClickDoneButton(weight: Int) {
//        self.doPostItemUseCase(weight: weight)
    }

}

// MARK: Private Function
private extension DefaultREDetailViewModel {
//    func doPostItemUseCase(weight: Int) {
//        let wasteId = self.requestValue.result.id
//        let requestValue = PostItemUseCaseRequest(wasteId: wasteId, weight: weight)
//
//        self.postItemUseCase.execute(requestValue).subscribe { [weak self] apiResult in
//            guard let self = self else { return }
//            switch apiResult {
//            case .success(_):
//                self.route.start(.dashboard)
//            case .failure(let errorDomain):
//                let error = NSError.create(with: errorDomain.details?.joined(separator: " ") ?? "Failed to post item")
//                print(error)
//            }
//        } onError: { error in
//            print(error)
//        }.disposed(by: self.disposeBag)
//    }
}
