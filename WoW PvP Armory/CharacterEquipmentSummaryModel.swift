//
//  CharacterEquipmentSummaryModel.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/17/22.
//

import Foundation

// MARK: - CharacterEquipmentSummary
struct CharacterEquipmentSummaryModel: Codable {
    let links: Links
    let character: Character
    let equippedItems: [EquippedItem]
    let equippedItemSets: [Set]

    enum CodingKeys: String, CodingKey {
        case links
        case character
        case equippedItems
        case equippedItemSets
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

// MARK: - Set
struct Set: Codable {
    let itemSet: Character
    let items: [ItemElement]
    let effects: [Effect]
    let displayString: String

    enum CodingKeys: String, CodingKey {
        case itemSet
        case items, effects
        case displayString
    }
}

// MARK: - Effect
struct Effect: Codable {
    let displayString: String
    let requiredCount: Int
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case displayString
        case requiredCount
        case isActive
    }
}

// MARK: - ItemElement
struct ItemElement: Codable {
    let item: Character
    let isEquipped: Bool?

    enum CodingKeys: String, CodingKey {
        case item
        case isEquipped
    }
}

// MARK: - EquippedItem
struct EquippedItem: Codable {
    let item: MediaClass
    let slot: Binding
    let quantity: Int
    let context: Int?
    let bonusList: [Int]?
    let quality: Binding
    let name: String
    let modifiedAppearanceID: Int?
    let media: MediaClass
    let itemClass, itemSubclass: Character
    let inventoryType, binding: Binding
    let armor: Armor?
    let stats: [Stat]?
    let sellPrice: SellPrice?
    let requirements: Requirements?
    let equippedItemSet: Set?
    let level: Durability
    let transmog: Transmog?
    let durability: Durability?
    let nameDescription: NameDescription?
    let isSubclassHidden: Bool?
    let enchantments: [Enchantment]?
    let limitCategory: String?
    let spells: [Spell]?
    let sockets: [Socket]?
    let uniqueEquipped, equippedItemDescription: String?
    let weapon: Weapon?

    enum CodingKeys: String, CodingKey {
        case item, slot, quantity, context
        case bonusList
        case quality, name
        case modifiedAppearanceID
        case media
        case itemClass
        case itemSubclass
        case inventoryType
        case binding, armor, stats
        case sellPrice
        case requirements
        case equippedItemSet
        case level, transmog, durability
        case nameDescription
        case isSubclassHidden
        case enchantments
        case limitCategory
        case spells, sockets
        case uniqueEquipped
        case equippedItemDescription
        case weapon
    }
}

// MARK: - Armor
struct Armor: Codable {
    let value: Int
    let display: NameDescription
}

// MARK: - NameDescription
struct NameDescription: Codable {
    let displayString: String
    let color: Color

    enum CodingKeys: String, CodingKey {
        case displayString
        case color
    }
}

// MARK: - Color
struct Color: Codable {
    let r, g, b, a: Int
}

// MARK: - Binding
struct Binding: Codable {
    let type, name: String
}

// MARK: - Durability
struct Durability: Codable {
    let value: Double
    let displayString: String

    enum CodingKeys: String, CodingKey {
        case value
        case displayString
    }
}

// MARK: - Enchantment
struct Enchantment: Codable {
    let displayString: String
    let sourceItem: Character
    let enchantmentID: Int
    let enchantmentSlot: EnchantmentSlot

    enum CodingKeys: String, CodingKey {
        case displayString
        case sourceItem
        case enchantmentID
        case enchantmentSlot
    }
}

// MARK: - EnchantmentSlot
struct EnchantmentSlot: Codable {
    let id: Int
    let type: String
}

// MARK: - MediaClass
struct MediaClass: Codable {
    let key: SelfClass
    let id: Int
}

// MARK: - Requirements
struct Requirements: Codable {
    let level: Durability
    let playableClasses: PlayableClasses?

    enum CodingKeys: String, CodingKey {
        case level
        case playableClasses
    }
}

// MARK: - PlayableClasses
struct PlayableClasses: Codable {
    let links: [Character]
    let displayString: String

    enum CodingKeys: String, CodingKey {
        case links
        case displayString
    }
}

// MARK: - SellPrice
struct SellPrice: Codable {
    let value: Int
    let displayStrings: DisplayStrings

    enum CodingKeys: String, CodingKey {
        case value
        case displayStrings
    }
}

// MARK: - DisplayStrings
struct DisplayStrings: Codable {
    let header: Header
    let gold, silver, copper: String
}

enum Header: String, Codable {
    case sellPrice = "Sell Price:"
}

// MARK: - Socket
struct Socket: Codable {
    let socketType: Binding
    let item: Character
    let displayString: String
    let media: MediaClass

    enum CodingKeys: String, CodingKey {
        case socketType
        case item
        case displayString
        case media
    }
}

// MARK: - Spell
struct Spell: Codable {
    let spell: Character
    let spellDescription: String
    let displayColor: Color?

    enum CodingKeys: String, CodingKey {
        case spell
        case spellDescription
        case displayColor
    }
}

// MARK: - Stat
struct Stat: Codable {
    let type: Binding
    let value: Int
    let display: NameDescription
    let isNegated, isEquipBonus: Bool?

    enum CodingKeys: String, CodingKey {
        case type, value, display
        case isNegated
        case isEquipBonus
    }
}

// MARK: - Transmog
struct Transmog: Codable {
    let item: Character
    let displayString: String
    let itemModifiedAppearanceID: Int

    enum CodingKeys: String, CodingKey {
        case item
        case displayString
        case itemModifiedAppearanceID
    }
}

// MARK: - Weapon
struct Weapon: Codable {
    let damage: Damage
    let attackSpeed, dps: Durability

    enum CodingKeys: String, CodingKey {
        case damage
        case attackSpeed
        case dps
    }
}

// MARK: - Damage
struct Damage: Codable {
    let minValue, maxValue: Int
    let displayString: String
    let damageClass: Binding

    enum CodingKeys: String, CodingKey {
        case minValue
        case maxValue
        case displayString
        case damageClass
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf
    }
}
