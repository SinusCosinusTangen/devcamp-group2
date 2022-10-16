//
//  REConfirmViewModel.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import Foundation
import RxSwift

// MARK: REConfirmViewModelResponse
public enum REConfirmViewModelResponse {
}

// MARK: REConfirmViewModelDelegate
public protocol REConfirmViewModelDelegate: AnyObject {
}

// MARK: - REConfirmViewModelRequestValue
public struct REConfirmViewModelRequestValue {
    var id: Int
}

// MARK: - REConfirmViewModelRoute
public struct REConfirmViewModelRoute {
    var start: (_ instructor: RecycleFlowCoordinatorInstructor) -> Void
}

// MARK: - REConfirmViewModelInput
public protocol REConfirmViewModelInput {
    func viewDidLoad()
    func didClickedConfirmButton()
}

// MARK: - REConfirmViewModelOutput
public protocol REConfirmViewModelOutput {
}

// MARK: - REConfirmViewModel
public protocol REConfirmViewModel: REConfirmViewModelInput, REConfirmViewModelOutput { }

// MARK: - DefaultREConfirmViewModel
public final class DefaultREConfirmViewModel: REConfirmViewModel {

    // MARK: Dependency Variable
    weak var delegate: REConfirmViewModelDelegate?
    let requestValue: REConfirmViewModelRequestValue
    let route: REConfirmViewModelRoute
    let disposeBag = DisposeBag()

    // MARK: UseCase ViewModel Variable
//    private let postNotifUseCase: PostNotifUseCase
    
    init(
        requestValue: REConfirmViewModelRequestValue,
        route: REConfirmViewModelRoute
//        postNotifUseCase: PostNotifUseCase
    ) {
        self.requestValue = requestValue
        self.route = route
//        self.postNotifUseCase = postNotifUseCase
    }

}

// MARK: Input ViewModel Function
public extension DefaultREConfirmViewModel {

    func viewDidLoad() {
    }
    
    func didClickedConfirmButton() {
//        self.doPostNotifUseCase()
    }

}

// MARK: Private Function
private extension DefaultREConfirmViewModel {
    
//    func doPostNotifUseCase() {
//        let requestValue = PostNotifUseCaseRequest()
//
//        self.postNotifUseCase.execute(requestValue).subscribe { [weak self] apiResult in
//            guard let self = self else { return }
//            switch apiResult {
//            case .success(_):
//                let requestValue = RESuccessViewModelRequestValue()
//                self.route.start(.success(requestValue: requestValue))
//            case .failure(let errorDomain):
//                let error = NSError.create(with: errorDomain.details?.joined(separator: " ") ?? "Failed to post item")
//                print(error)
//            }
//        } onError: { error in
//            print(error)
//        }.disposed(by: self.disposeBag)
//    }
}
