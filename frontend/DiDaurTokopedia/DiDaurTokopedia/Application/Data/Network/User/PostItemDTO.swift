//
//  PostItemDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct PostItemDTO {

        public static func getURL(id: Int) -> String {
            return "http://20.24.244.160:8000/api/recycle/\(id)"
        }

        public struct Response {
            let body: Body
        }

    }

}

public extension DaurEndpoint.PostItemDTO.Response {

    struct Body: Codable { }

}
