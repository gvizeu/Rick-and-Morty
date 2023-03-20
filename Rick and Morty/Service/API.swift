//
//  API.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation
import UIKit

protocol APIRepositoryProtocol {
    func fetchData<T: Decodable>(from router: APIRouter, useCache: Bool) async throws -> T
    func fetchImage(for imageURL: URL) async throws -> UIImage?
}

class APIRepository: APIRepositoryProtocol {
    private let baseURL = "https://rickandmortyapi.com/api"
    private let urlSession: URLSession
    private var cache = NSCache<NSString, NSData>()
    private let config: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        return config
    }()
    

    init () {
        self.urlSession = URLSession(configuration: config)
    }

    func fetchData<T: Decodable>(from router: APIRouter, useCache: Bool = true) async throws -> T {
        let urlRequest = router.getURL(from: URL(string: baseURL)!)
        guard let absoluteURL = urlRequest.url?.absoluteString else { throw APIError.invalidURL }
        if useCache, let cachedData = cache.object(forKey: absoluteURL as NSString) {
            return try decodeResponse(from: cachedData as Data)
        }
        let (data, response) = try await urlSession.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APIError.notFound
        }
        if useCache {
            cache.setObject(data as NSData, forKey: absoluteURL as NSString)
        }
        return try decodeResponse(from: data)
    }
    
    private func decodeResponse<T: Decodable>(from data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
    
    func fetchImage(for imageURL: URL) async throws -> UIImage? {
        let request = URLRequest(url: imageURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let image = UIImage(data: data) else { return nil }
        ImageCache.current.add(image, for: imageURL)
        return image
    }
}
