//
//  CharacterAchievementStatistics.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/25/22.
//

import Foundation

// MARK: - CharacterAchievementStatistics
struct CharacterAchievementStatistics: Codable {
    let character: Character
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let subCategories: [Category]?
    let statistics: [Statistic]
}

// MARK: - Statistic
struct Statistic: Codable {
    let id: Int
    let name: String
    let quantity: Double
}
