//
//  CharacterEquipmentSummaryModel.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/17/22.
//

import Foundation

// MARK: - CharacterEquipmentSummary
struct CharacterEquipmentSummary: Codable {
    let character: Character
    let equippedItems: [EquippedItem]
}

struct EquippedItem: Codable {
    let item: Item
    let slot: Slot
    let quality: Quality
    let inventoryType: InventoryType
}

struct Item: Codable {
    let key: Int
}

struct Slot: Codable {
    let type, name: String
}

struct Quality: Codable {
    let type, name: String
}

struct InventoryType: Codable {
    let type, name: String
}
