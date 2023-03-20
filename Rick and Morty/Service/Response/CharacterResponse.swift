//
//  CharacterResponse.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}
