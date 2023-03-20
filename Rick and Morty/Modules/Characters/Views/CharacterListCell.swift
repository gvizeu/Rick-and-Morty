//
//  CharacterListCell.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 15/3/23.
//

import SwiftUI

struct CharacterListCell: View {
    private let character: Character
    private var width: CGFloat
    
    init(character: Character, size: CGSize) {
        self.character = character
        self.width = (size.width / 2) - 8
    }

    var body: some View {
        VStack(spacing: 0) {
            ImageView(imageURL: character.image)
                .aspectRatio(contentMode: .fill)
                .padding(.bottom)
                .frame(width: self.width, height: self.width)
            VStack {
                
                RickText(character.name)
                    .font(.primary(size: 18))
                RickText(character.species)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            .lineLimit(1)
        }
    }
}

struct CharacterListItemView_Previews: PreviewProvider {
    static private let character = MockCharaters.characters.first!
    static var previews: some View {
        CharacterListCell(character: self.character, size: CGSize(width: 200, height: 200))
    }
}
