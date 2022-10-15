//
//  FetchUserDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct FetchUserDTO {

        public static let url = "http://18.207.189.252/api/user/1"

        public struct Response {
            let body: Body
        }

    }

}

public extension DaurEndpoint.FetchUserDTO.Response {

    struct Body: Codable {
        let id: Int?
        let name, address: String?
        let coins, exp: Int?
        let createdAt, updatedAt: String?

        enum CodingKeys: String, CodingKey {
            case id, name, address, coins, exp
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
        
        public func toDomain() -> FetchUserDomain {
            return FetchUserDomain(
                id: self.id ?? 0,
                name: self.name ?? "",
                address: self.address ?? "",
                coins: self.coins ?? 0,
                exp: self.exp ?? 0,
                createdAt: self.createdAt ?? "",
                updatedAt: self.updatedAt ?? ""
            )
        }
    }

}





