//
//  MockAPIRespository.swift
//  Rick and MortyTests
//
//  Created by Gonzalo Vizeu on 20/3/23.
//

import Foundation
import UIKit

class MockAPIRespository: APIRepositoryProtocol {
    
    func fetchData<T>(from router: APIRouter, useCache: Bool) async throws -> T where T : Decodable {
        guard let data = MockCharaters.charactersJSON.data(using: .utf8) else {
            assertionFailure()
            throw APIError.decodingError
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func fetchImage(for imageURL: URL) async throws -> UIImage? {
        return nil
    }
    
    
}
