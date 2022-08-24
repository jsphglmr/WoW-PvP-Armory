//
//  CharacterSearch.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/23/22.
//

import SwiftUI

enum NetworkError: Error {
    case badURL
    case badID
}

@MainActor
class CharacterListViewModel: ObservableObject {
    
    @Published var items: [ItemViewModel] = []
    
    func search(name: String, realm: String) async {
        do {
            let items = try await CharacterSearch().getCharacterEquipment(name: name, realm: realm)
            self.items = items.map(ItemViewModel.init)
        } catch {
            print(error)
        }
    }
}

class CharacterSearch: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let jsonManager: JSONManager
    
    init(jsonManager: JSONManager = JSONManager()) {
        self.jsonManager = jsonManager
    }
    
    //MARK: - Fetch
    
    func fetchWowCharacterEquipmentSummary(name: String, realm realmSlug: String, completion: @escaping (Result<CharacterEquipmentSummary, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/equipment"
        jsonManager.performRequest(with: url, completion: completion)
    }
    
    func fetchWowCharacterAchievementStatistics(name: String, realm realmSlug: String, completion: @escaping (Result<CharacterAchievementStatistics, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/achievements/statistics"
        jsonManager.performRequest(with: url, completion: completion)
    }
    
    
    //MARK: - async calls
    
    func getCharacterEquipment(name: String, realm: String) async throws -> [EquippedItem] {
        guard let equipmentUrl = URL(string: "https://us.api.blizzard.com/profile/wow/character/\(realm)/\(name)/achievements/statistics\(Constants.accessTokenURL)") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: equipmentUrl)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let characterResponse = try? JSONDecoder().decode(CharacterEquipmentSummary.self, from: data)
        return characterResponse?.equippedItems ?? []
    }
    
    func getItemInfo(itemID: String, realm: String) async throws -> [EquippedItem] {
        guard let itemURL = URL(string: "https://us.api.blizzard.com/data/wow/media/item/\(itemID)\(Constants.accessTokenURL)") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: itemURL)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let itemResponse = try? JSONDecoder().decode(CharacterEquipmentSummary.self, from: data)
        return itemResponse?.equippedItems ?? []
    }
    
    
}


