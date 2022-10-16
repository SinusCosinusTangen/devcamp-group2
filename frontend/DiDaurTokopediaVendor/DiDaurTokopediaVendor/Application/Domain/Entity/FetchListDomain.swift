//
//  FetchUserDomain.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public struct FetchListDomain {
    let result: [ResultDomain]
}

public struct ResultDomain {
    let tpsID: Int
    let address: String
    let weight: Int
}
