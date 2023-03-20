//
//  CharacterViewModel.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation

@MainActor
class CharacterListViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var searchText = ""
    @Published var filterOptions = CharacterFilter()
    @Published var isFetching = false
    @Published var index = 0
    @Published var error: String?

    private let characterRepository: CharacterRepository
    
    init(characterRepository: CharacterRepository = DefaultCharacterRepository(apiRepository: APIRepository())) {
        self.characterRepository = characterRepository
    }
    
    func fetchCharacters() async {
        do {
            guard !isFetching else { return }
            self.isFetching.toggle()
            self.characters.append(contentsOf: try await characterRepository.fetchFilteredCharacteres(filter: self.filterOptions))
            self.error = nil
            self.filterOptions.page += 1
            self.isFetching.toggle()
        } catch {
            self.isFetching.toggle()
            guard let error = error as? APIError else { return }
            self.error = error.message
        }
    }
    
    func loadNextPage(currentItem: Character?) async {
        guard let currentItem = currentItem else { return }
        guard isLastIndex(from: currentItem) else { return }
        await fetchCharacters()
    }

    func applyFilters() {
        Task {
            self.filterOptions.page = 1
            self.characters = []
            await fetchCharacters()
        }
    }
    
    func didTapCharacter(_ character: Character) {
        self.index = getIndex(of: character)
    }
    
    private func isLastIndex(from character: Character) -> Bool  {
        let currentIndex = getIndex(of: character)
        return currentIndex == self.characters.count - 1
    }
    
    private func getIndex(of character: Character) -> Int {
        self.characters.firstIndex(where: { $0.id == character.id }) ?? 0
    }
}
