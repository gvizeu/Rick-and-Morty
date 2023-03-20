//
//  MockCharacterRepository.swift
//  Rick and MortyTests
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation
import UIKit

class MockCharacterRepository: CharacterRepository {
    var shouldThrowError = false
    
    func fetchFilteredCharacteres(filter: CharacterFilter) async throws -> [Character] {
        guard !shouldThrowError else { throw NSError(domain: "Test Error", code: 0, userInfo: nil) }
        
        switch filter.page {
        case 1: return filterCharacteres(filter, characters: MockCharaters.characters)
        case 2: return filterCharacteres(filter, characters: MockCharaters.characters)
        default: return []
        }
    }
    
    private func filterCharacteres(_ filter: CharacterFilter, characters: [Character]) -> [Character] {
        return characters.filter { character in
            if let gender = filter.gender {
                guard character.gender == gender else { return false }
            }
            if let species = filter.species {
                guard character.species == species else { return false }
            }
            if let status = filter.status {
                guard character.status == status else { return false }
            }
            guard !filter.name.isEmpty else { return true }
            return character.name.contains(filter.name)
        }
    }
}
