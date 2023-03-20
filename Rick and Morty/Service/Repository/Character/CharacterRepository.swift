//
//  CharacterRepository.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation
import UIKit

protocol CharacterRepository {
    func fetchFilteredCharacteres(filter: CharacterFilter) async throws -> [Character]
}

class DefaultCharacterRepository: CharacterRepository {
    private let apiRepository: APIRepositoryProtocol
    private var pages: Int?
    
    init(apiRepository: APIRepositoryProtocol) {
        self.apiRepository = apiRepository
    }
    
    func fetchFilteredCharacteres(filter: CharacterFilter) async throws -> [Character] {
        
        if let pages = pages, pages < filter.page {
            throw APIError.maxNumberPageReached
        }
        let result: CharacterResponse = try await apiRepository.fetchData(from: CharacterRouter.filter(filter: filter), useCache: true)
        self.pages = result.info.pages
        return result.results
    }
}
