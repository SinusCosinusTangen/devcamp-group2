//
//  UseCaseFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public protocol UseCaseFactory {
    func makeFetchUserUseCase() -> FetchUserUseCase
    func makePostItemUseCase() -> PostItemUseCase
}
