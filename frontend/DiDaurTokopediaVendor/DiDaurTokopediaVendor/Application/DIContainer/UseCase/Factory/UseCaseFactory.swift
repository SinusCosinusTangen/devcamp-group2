//
//  UseCaseFactory.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public protocol UseCaseFactory {
    func makeFetchUserUseCase() -> FetchUserUseCase
    func makeFetchListUseCase() -> FetchListUseCase
    func makeFetchBuyUseCase() -> FetchBuyUseCase
//    func makePostItemUseCase() -> PostItemUseCase
//    func makePostNotifUseCase() -> PostNotifUseCase
}
