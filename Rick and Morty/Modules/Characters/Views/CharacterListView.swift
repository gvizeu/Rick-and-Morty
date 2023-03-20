//
//  CharacterListView.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel = CharacterListViewModel()
    @State private var size: CGSize = .zero
    @State private var isPresentingFilterOptions = false
    @State private var path = NavigationPath()
    
    private let columns = [GridItem(.flexible()),
                           GridItem(.flexible())]
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometry in
                VStack {
                    searchBar
                    ScrollView {
                        ScrollViewReader { sp in
                            LazyVGrid(columns: columns) {
                                ForEach(Array(viewModel.characters.enumerated()), id: \.offset) { (index, character) in
                                    CharacterListCell(character: character, size: geometry.size)
                                        .task { await self.viewModel.loadNextPage(currentItem: character) }
                                        .onTapGesture {
                                            self.viewModel.didTapCharacter(character)
                                            self.path.append(character)
                                        }
                                }
                            }
                            .padding(8)
                            .navigationDestination(for: Character.self) { character in
                                CharacterDetailView(characters: self.viewModel.characters, index: $viewModel.index, proxy: sp)
                                    .onReceive(viewModel.$index) { index in
                                        let character  = self.viewModel.characters[index]
                                        Task { await self.viewModel.loadNextPage(currentItem: character) }
                                    }
                            }
                        }
                        if viewModel.isFetching {
                            ProgressView().frame(maxWidth: .infinity, alignment: .center).tint(.primary)
                        }
                        if let error = viewModel.error {
                            RickText(error)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    RickText(.characters, width: 1)
                        .font(.primary(size: 36))
                }
            }
            .toolbarBackground(Color.black, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .background(Image.rickMortyBg.resizable().ignoresSafeArea())
        }
        .task { await viewModel.fetchCharacters() }
        .sheet(isPresented: $isPresentingFilterOptions) { filter }
    }
    
    var searchBar: some View {
        SearchBar(searchText: $viewModel.filterOptions.name,
                  onCommit: { self.viewModel.applyFilters() },
                  rightButton: {
            Button(action: { isPresentingFilterOptions = true }) {
                Image.filterIcon
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        })
    }
    
    private var filter: some View {
        FilterOptionsView(filterOptions: $viewModel.filterOptions,
                          isPresented: $isPresentingFilterOptions,
                          onApplyFilters:  { self.viewModel.applyFilters() })
        .presentationDetents([.fraction(0.5), .large])
    }
}



struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
