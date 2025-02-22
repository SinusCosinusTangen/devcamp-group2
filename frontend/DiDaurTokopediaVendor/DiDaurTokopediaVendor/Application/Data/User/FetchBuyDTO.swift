//
//  FetchUserDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct FetchBuyDTO {

        public static let url = "http://20.24.244.160:8000/api/buy-waste"

        public struct Response {
            let body: Body
        }
        
        public struct Request {
            let parameter: Parameter
        }

    }

}
public extension DaurEndpoint.FetchBuyDTO.Request {
    struct Parameter {
        var tpsID: Int = 1
        var weight: Int
        
        public func get() -> [String:Any] {
            return [
                "tps_id": self.tpsID,
                "weight": self.weight
            ]
        }
    }
}

public extension DaurEndpoint.FetchBuyDTO.Response {
    

    struct Body: Codable {
        let tpsID, weight: Int?

        enum CodingKeys: String, CodingKey {
            case tpsID = "tps_id"
            case weight
        }
        
        public func toDomain() -> FetchBuyDomain {
            return FetchBuyDomain(
                tpsID: self.tpsID ?? 0,
                weight: self.weight ?? 0
            )
        }
    }

}





