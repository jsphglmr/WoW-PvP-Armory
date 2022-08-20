//
//  CharacterAchievementStatisticsModel.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/20/22.
//

import Foundation

// MARK: - CharacterAchievementStatisticsModel
struct CharacterAchievementStatisticsModel: Codable {
    let links: Links
    let character: Character
    let categories: [Category]

    enum CodingKeys: String, CodingKey {
        case links
        case character, categories
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let subCategories: [Category]?
    let statistics: [Statistic]

    enum CodingKeys: String, CodingKey {
        case id, name
        case subCategories
        case statistics
    }
}

// MARK: - Statistic
struct Statistic: Codable {
    let id: Int
    let name: String
    let lastUpdatedTimestamp: Int
    let quantity: Double
    let statisticDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case lastUpdatedTimestamp
        case quantity
        case statisticDescription
    }
}

// MARK: - Character
class Character: Codable {
    let key: SelfClass
    let name: String
    let id: Int
    let realm: Character?
    let slug: String?

    init(key: SelfClass, name: String, id: Int, realm: Character?, slug: String?) {
        self.key = key
        self.name = name
        self.id = id
        self.realm = realm
        self.slug = slug
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf
    }
}
