//
//  FetchUserDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct FetchListDTO {

        public static let url = "http://20.24.244.160:8000/api/ready-waste"

        public struct Response {
            let body: Body
        }

    }

}

public extension DaurEndpoint.FetchListDTO.Response {

    struct Body: Codable {
        let result: [Result]
        
        public func toDomain() -> FetchListDomain {
            return FetchListDomain(result: self.result.compactMap({ $0.toDomain() }))
        }
    }

    struct Result: Codable {
        let tpsID: Int?
        let address: String?
        let weight: Int?

        enum CodingKeys: String, CodingKey {
            case tpsID = "tps_id"
            case address, weight
        }
        
        public func toDomain() -> ResultDomain {
            return ResultDomain(
                tpsID: self.tpsID ?? 0,
                address: self.address ?? "",
                weight: self.weight ?? 0
            )
        }
    }
}





