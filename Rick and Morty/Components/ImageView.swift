//
//  ImageView.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 15/3/23.
//

import SwiftUI

struct ImageView: View {
    private var imageCache = ImageCache.current
    private let imageURL: String
    @State private var image: UIImage?
    
    init(imageURL: String) {
        self.imageURL = imageURL
    }

    var body: some View {
        Group {
            if let uiImage = self.image {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                ProgressView(String.loading)
                Spacer()
            }
        }
        .aspectRatio(contentMode: .fit)
        .task { image = await imageCache.getImage(from: self.imageURL) }
    }
}
