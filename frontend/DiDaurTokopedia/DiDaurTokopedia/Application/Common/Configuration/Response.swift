//
//  Response.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public struct Response<T: Decodable>: Decodable {
    let isSuccess: Bool
    let data: T?
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case isSuccess = "is_success"
        case data
        case errorMessage = "error_message"
    }
}

public struct EmptyData: Decodable {}
