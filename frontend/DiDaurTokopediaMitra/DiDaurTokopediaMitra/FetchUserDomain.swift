//
//  FetchUserDomain.swift
//  DiDaurTokopediaMitra
//
//  Created by Daffashiddiq on 16/10/22.
//

import Foundation

public struct FetchUserDomain: Codable {
    let id: Int
    let name, address: String
    let weight: Int
    let isReady: Bool
    let createdAt, updatedAt: String
}
