//
//  Gender.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 15/3/23.
//

import Foundation

enum Gender: String, Codable, CaseIterable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
}
