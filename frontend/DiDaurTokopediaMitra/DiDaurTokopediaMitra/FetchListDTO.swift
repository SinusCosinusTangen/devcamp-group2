//
//  FetchUserDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct FetchListDTO {

        public static let url = "http://20.247.50.226:8000/api/waste"

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
        let id, userID: Int?
        let address: String?

        enum CodingKeys: String, CodingKey {
            case id
            case userID = "user_id"
            case address
        }
        
        public func toDomain() -> ResultDomain {
            return ResultDomain(
                id: self.id ?? 0,
                userID: self.userID ?? 0,
                address: self.address ?? ""
            )
        }
    }


}





