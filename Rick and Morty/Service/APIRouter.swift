//
//  APIRouter.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation
enum HTTPMethod: String {
    case GET, POST, PUT, DELETE
}
protocol APIRouter {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    func getURL(from baseURL: URL) -> URLRequest
}

extension APIRouter {
    func getURL(from baseURL: URL) -> URLRequest {
        var components = URLComponents()
        components.path = "api" + self.path
        
        components.queryItems = self.parameters?.compactMap {
            URLQueryItem(name: $0, value: "\($1)")
        }
        .sorted(using: KeyPathComparator(\.name))
        var urlRequest = URLRequest(url: components.url(relativeTo: baseURL)!)
        urlRequest.httpMethod = self.method.rawValue
        return urlRequest
    }
}
