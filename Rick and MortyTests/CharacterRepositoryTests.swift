//
//  CharacterRepositoryTests.swift
//  Rick and MortyTests
//
//  Created by Gonzalo Vizeu on 20/3/23.
//

import XCTest
@testable import Rick_and_Morty

final class CharacterRepositoryTests: XCTestCase {
    var repository: CharacterRepository!
    
    override func setUp() {
        super.setUp()
        self.repository = DefaultCharacterRepository(apiRepository: MockAPIRespository())
    }

    func testFetchCharacteresSuccess() async throws {
        let characters = try await repository.fetchFilteredCharacteres(filter: CharacterFilter())
        XCTAssert(characters.count > 0)
    }
    
    func testReachLimitFechingCharacters() async throws {
        var filter = CharacterFilter()
        let characters = try await repository.fetchFilteredCharacteres(filter: filter)
        XCTAssert(characters.count > 0)
        filter.page = 44
        do {
            let _ = try await repository.fetchFilteredCharacteres(filter: filter)
            XCTFail()
        } catch {
            guard let error = error as? APIError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error, .maxNumberPageReached)
        }
    }
}
