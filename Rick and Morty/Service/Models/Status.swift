//
//  Status.swift
//  Rick and Morty
//
//  Created by Gonzalo Vizeu on 15/3/23.
//

import Foundation

enum Status: String, Codable, CaseIterable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
