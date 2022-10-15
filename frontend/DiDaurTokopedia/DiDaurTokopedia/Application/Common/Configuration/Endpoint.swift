////
////  Endpoint.swift
////  DiDaurTokopedia
////
////  Created by Daffashiddiq on 15/10/22.
////
//
//import Foundation
//
//protocol Endpoint {
//    var host: String { get }
//    var path: String { get }
//    var method: HTTPMethod { get }
//    var header: [String: String]? { get }
//    var body: [String: Any]? { get }
//}
//
//extension Endpoint {
//    var method: HTTPMethod { .get }
//    var header: [String: String]? { nil }
//    var body: [String: Any]? { nil }
//
//    var urlRequest: URLRequest? {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "http"
//        urlComponents.host = host
//        urlComponents.path = path
//        
//        guard let url = urlComponents.url else { return nil }
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = method.rawValue
//        urlRequest.allHTTPHeaderFields = header
//
//        if let body = body {
//            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
//        }
//        
//        return urlRequest
//    }
//}
