//
//  PvPModel.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/25/22.
//

import Foundation

struct PVPModel: Codable {
    let character: Character
    let faction: Faction
    let bracket: Bracket
    let rating: Int
    let season, tier: Season
    let seasonMatchStatistics, weeklyMatchStatistics: MatchStatistics
}

// MARK: - Bracket
struct Bracket: Codable {
    let id: Int
    let type: String
}

// MARK: - Faction
struct Faction: Codable {
    let type, name: String
}

// MARK: - Season
struct Season: Codable {
    let id: Int
}

// MARK: - MatchStatistics
struct MatchStatistics: Codable {
    let played, won, lost: Int
}
