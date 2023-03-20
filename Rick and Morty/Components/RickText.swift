//
//  RickText.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 17/3/23.
//

import SwiftUI

struct RickText: View {
    private let text: String
    private let width: CGFloat
    private let color: Color

    init(_ text: String, width: CGFloat = 0.25, color: Color = .primary) {
        self.text = text
        self.width = width
        self.color = color
    }
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width).foregroundColor(color).shadow(color: color, radius: 1.5)
                Text(text).offset(x: -width, y: -width).foregroundColor(color).shadow(color: color, radius: 1.5)
                Text(text).offset(x: -width, y:  width).foregroundColor(color).shadow(color: color, radius: 1.5)
                Text(text).offset(x:  width, y: -width).foregroundColor(color).shadow(color: color, radius: 1.5)
                Text(text).offset(x:  0.35, y:  0.35).foregroundColor(.black)
                Text(text).offset(x: -0.35, y: -0.35).foregroundColor(.black)
                Text(text).offset(x: -0.35, y:  0.35).foregroundColor(.black)
                Text(text).offset(x:  0.35, y: -0.35).foregroundColor(.black)
            }
            Text(text)
        }
        .foregroundColor(.secondary)
    }
}
