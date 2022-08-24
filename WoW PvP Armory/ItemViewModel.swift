//
//  ItemViewModel.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/23/22.
//

import Foundation


struct ItemViewModel {
    let equippedItem: EquippedItem
    
    var rarity: String {
        equippedItem.quality.name
    }
    
    var iconURLString: String? {
        equippedItem.item.assets?.value
    }
    
    var itemID: Int {
        equippedItem.item.id ?? 19019
    }
}
