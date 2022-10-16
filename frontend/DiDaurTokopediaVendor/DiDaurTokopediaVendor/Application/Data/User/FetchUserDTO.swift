//
//  FetchUserDTO.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension DaurEndpoint {

    struct FetchUserDTO {

        public static let url = "http://20.24.244.160:8000/api/vendor/1"

        public struct Response {
            let body: Body
        }

    }

}

public extension DaurEndpoint.FetchUserDTO.Response {

    struct Body: Codable {
        let id: Int?
        let name, address, createdAt, updatedAt: String?

        enum CodingKeys: String, CodingKey {
            case id, name, address
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
        
        public func toDomain() -> FetchUserDomain {
            return FetchUserDomain(
                id: self.id ?? 0,
                name: self.name ?? "",
                address: self.address ?? "",
                createdAt: self.createdAt ?? "",
                updatedAt: self.updatedAt ?? ""
            )
        }
    }
}





