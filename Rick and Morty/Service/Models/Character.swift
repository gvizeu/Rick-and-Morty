//
//  Character.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 13/3/23.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let gender: Gender
    let location: Location
    let origin: Origin
    let image: String
    
    init(id: Int, name: String, species: String, gender: Gender, status: Status) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.location = Location(name: "")
        self.image = ""
        self.origin = Origin(name: "")
    }

    struct Origin: Codable {
        let name: String
    }
    
    struct Location: Codable {
        let name: String
    }
}

extension Character: Hashable {
    public func hash(into hasher: inout Hasher) {
           return hasher.combine(id)
    }
    static func == (lhs: Character, rhs: Character) -> Bool {
        guard lhs.id == rhs.id else { return false }
        return true
    }
}
