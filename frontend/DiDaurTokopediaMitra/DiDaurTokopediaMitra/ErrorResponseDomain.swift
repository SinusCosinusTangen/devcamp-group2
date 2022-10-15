//
//  ErrorResponseDomain.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public struct ErrorResponseDomain: Codable {
    var status: Int? = nil
    var message: String? = nil
    var errorCode: Int? = nil
    var timestamp: Int? = nil
    var details: [String]? = nil
}
