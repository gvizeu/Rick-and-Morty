//
//  APIError.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 20/3/23.
//

import Foundation

enum APIError: Error {
    case notFound
    case decodingError
    case invalidURL
    case maxNumberPageReached

    var message: String {
        switch self {
        case .notFound: return .errorNotFound
        case .invalidURL: return .errorInvalidURL
        case .maxNumberPageReached: return .errorMaxNumberPageReached
        default: return self.localizedDescription
        }
    }
}
