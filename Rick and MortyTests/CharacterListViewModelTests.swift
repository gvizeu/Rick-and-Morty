//
//  CharacterListViewModelTests.swift
//  Rick and MortyTests
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import XCTest
@testable import Rick_and_Morty
@MainActor
class CharacterListViewModelTests: XCTestCase {
    var repository: MockCharacterRepository!
    var viewModel: CharacterListViewModel!
    override func setUp() {
        super.setUp()
        self.repository = MockCharacterRepository()
        viewModel = CharacterListViewModel(characterRepository: repository)
    }
    func testFetchCharactersSuccess() async throws {
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 6)
        XCTAssertEqual(viewModel.characters[0].name, "Rick Sanchez")
        XCTAssertEqual(viewModel.characters[1].name, "Morty Smith")
        XCTAssertEqual(viewModel.characters[2].name, "Summer Smith")
    }
    
    func testFetchCharactersFailure() async throws {
        repository.shouldThrowError = true
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 0)
       }
    
    func testFilterCharacteres() async throws {
        viewModel.filterOptions.gender = .female
        await viewModel.fetchCharacters()
        guard viewModel.characters.count == 3 else {
            XCTAssertEqual(viewModel.characters.count, 3)
            return
        }
        XCTAssertEqual(viewModel.characters[0].gender, .female)
        XCTAssertEqual(viewModel.characters[1].gender, .female)
        XCTAssertEqual(viewModel.characters[2].gender, .female)
    }
    
    func testCharacteresPagination() async throws {
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 6)
        XCTAssertEqual(viewModel.filterOptions.page, 2)
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 12)
        XCTAssertEqual(viewModel.filterOptions.page, 3)
    }
    
    func testCharacteresPaginationEnd() async throws {
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 6)
        XCTAssertEqual(viewModel.filterOptions.page, 2)
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 12)
        XCTAssertEqual(viewModel.filterOptions.page, 3)
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 12)
        XCTAssertEqual(viewModel.filterOptions.page, 4)
    }
    
    func testFetchingStatus() async throws {
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.isFetching, false)
    }
    
    func testSkipFetchWhileFetch() async throws {
        viewModel.isFetching = true
        await viewModel.fetchCharacters()
        XCTAssertEqual(viewModel.characters.count, 0)
        XCTAssertEqual(viewModel.isFetching, true)
    }
}
