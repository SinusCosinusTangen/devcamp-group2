//
//  NetworkError.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURLRequest
    case noResponse
    case decoding
    case unauthorized
    case underlying(Error)
}
