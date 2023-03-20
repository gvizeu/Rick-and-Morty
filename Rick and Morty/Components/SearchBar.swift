//
//  SearchBar.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 17/3/23.
//

import SwiftUI

struct SearchBar<Content>: View where Content: View  {
    
    @Binding private var searchText: String
    private var onCommit: () -> Void
    private var rightButton: () -> Content?
    init(searchText: Binding<String>,
         onCommit: @escaping () -> Void,
         @ViewBuilder rightButton: @escaping () -> Content = { EmptyView() }) {
        self._searchText = searchText
        self.onCommit = onCommit
        self.rightButton = rightButton
    }
    
    var body: some View {
        HStack(spacing: 8) {
            HStack {
                TextField(String.search, text: $searchText, onCommit: onCommit)
                    .frame(height: 32)
                if !searchText.isEmpty {
                    Button(action: cancelAction) {
                        Image.crossCircleIcon
                    }
                }
            }
            .padding(.horizontal, 4)
            .background(Color.secondary.opacity(0.75))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 1))
            rightButton()
        }
        .padding(8)
        .background(Color.primary.opacity(0.75))
        .cornerRadius(8)
        .padding()
        .tint(.black)
    }
    
    private func cancelAction() {
        searchText = ""
        onCommit()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), onCommit: {  })
    }
}
