//
//  Character.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/20/22.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let name: String
    let realm: Realm
}

// MARK: - Realm
struct Realm: Codable {
    let id: Int
    let name: String
    let slug: String
}
