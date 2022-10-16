//
//  PostItemDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct PostItemDTO {

        public static let url = "http://20.24.244.160:8000/api/confirm"

        public struct Request {
            let Parameter: Parameter
        }
//        public struct Response {
//            let body: Body
//        }

    }

}
public extension DaurEndpoint.PostItemDTO.Request {
    struct Parameter {
        var wasteId: Int
        var weight: Int
        
        public func get() -> [String:Any] {
            return [
                "id": self.wasteId,
                "tps_id": 1,
                "weight": self.weight
            ]
        }
    }
}
//public extension DaurEndpoint.PostItemDTO.Response {
//
//    struct Body: Codable { }
//
//}
