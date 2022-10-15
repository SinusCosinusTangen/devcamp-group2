//
//  PostItemDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct PostNotifDTO {

        public static let url = "http://20.247.50.226:8000/api/ready/1"

        public struct Response {
            let body: Body
        }

    }

}

public extension DaurEndpoint.PostNotifDTO.Response {

    struct Body: Codable { }

}
