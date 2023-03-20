//
//  CharacterDetailCard.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 17/3/23.
//

import SwiftUI

struct CharacterDetailCard: View {
    
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImageView(imageURL: self.character.image)
                RickText(character.name, width: 0.75)
                    .font(.primary(size: 50))
                    .shadow(color: .primary, radius: 1)
                    .padding(.top)
                RickText(.status + ": " +  character.status.rawValue)
                    .padding(.top)
                RickText(.species + ": " +  character.species)
                    .padding(.top)
                RickText(.gender + ": " +  character.gender.rawValue)
                    .padding(.top)
                RickText(.origin + ": " +  character.origin.name)
                    .padding(.top)
                RickText(.location + ": " +  character.location.name)
                    .padding(.top)
            }
            .padding()
        }
    }
}

struct CharacterDetailCard_Previews: PreviewProvider {
    static private let character = MockCharaters.characters.first!
    static var previews: some View {
        CharacterDetailCard(character: character)
    }
}
