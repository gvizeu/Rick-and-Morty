//
//  CharacterDetailView.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 15/3/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @Binding private var index: Int
    private let proxy: ScrollViewProxy?
    private var characters: [Character]
    
    @Environment(\.presentationMode) private var mode: Binding<PresentationMode>
    
    init(characters: [Character], index: Binding<Int>, proxy: ScrollViewProxy? = nil) {
        self.characters = characters
        self.proxy = proxy
        self._index = index
    }
    
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach(Array(characters.enumerated()), id: \.offset) { (index, character) in
                    if self.index == index {
                        HStack(alignment: .center, spacing: 0) {
                            if self.index != 0 { leftButton }
                            CharacterDetailCard(character: character)
                            if self.index != self.characters.count - 1 {
                                rightButton
                            }
                        }
                    } else {
                        Color.clear.tag(index)
                    }
                }
            }
            .background(Image.rickMortyBg.resizable().ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action : {
                self.proxy?.scrollTo(index, anchor: .center)
                self.mode.wrappedValue.dismiss()
            }){
                Image.arrowLeft.tint(.secondary)
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
    
    private var leftButton: some View {
        Button(action: { self.index -= 1 },
               label: { Image.chevronLeft
            .resizable()
            .frame(width: 16, height: 100)
            .tint(.secondary) })
    }
    
    private var rightButton: some View {
        Button(action: { self.index += 1 },
               label: { Image.chevronRight
            .resizable()
            .frame(width: 16, height: 100)
            .tint(.secondary) })
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(characters: MockCharaters.characters, index: .constant(0))
    }
}
