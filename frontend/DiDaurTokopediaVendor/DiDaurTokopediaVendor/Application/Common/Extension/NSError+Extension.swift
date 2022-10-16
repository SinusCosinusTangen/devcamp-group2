//
//  NSError+Extension.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import Foundation

public extension NSError {
    
    class func create(with message: String, code: Int = -100, userInfo: [String: Any]? = nil) -> NSError {
        return NSError(domain: message, code: code, userInfo: userInfo)
    }
    
    class func create(from errorDomain: ErrorResponseDomain) -> NSError {
        let message = errorDomain.details?.joined(separator: " ") ?? (errorDomain.message ?? "Error occured")
        return self.create(with: message)
    }
    
}
