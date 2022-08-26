//
//  CharacterSearch.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/23/22.
//

import SwiftUI

class CharacterSearch: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    @Published var character: Character?
    @Published var characterEquipment: CharacterEquipmentSummary?
    @Published var characterStatistics: CharacterAchievementStatistics?
    @Published var current2v2: PvP?
    @Published var current3v3: PvP?
    @Published var currentRBG: PvP?
    
    let jsonManager: JSONManager
    
    init(jsonManager: JSONManager = JSONManager(), name: String, realm: String, itemID: Int?) {
        self.jsonManager = jsonManager
        
        fetchCurrent2v2Rating(name: "jojo", realm: "Tichondrius") { result in
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            case .success(let pvp):
                self.current2v2 = pvp
            }
        }
        
        fetchAllInfo(name: name, realm: realm, itemID: itemID)
        dump(character)
        dump(characterEquipment)
        dump(characterStatistics)
        dump(current2v2)
        dump(current3v3)
        dump(currentRBG)
    }
    
    
    func fetchAllInfo(name: String, realm: String, itemID: Int?) {
        
        isLoading = true
        errorMessage = nil
        
        DispatchQueue.main.async {
            self.isLoading = false
            
        //equipment
            self.fetchEquipment(name: name, realm: realm) { result in
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    
                case .success(let characterEquipment):
                    self.characterEquipment = characterEquipment
                }
            }
        //stats
            self.fetchAchievementStatistics(name: name, realm: realm) { result in
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    
                case .success(let characterStatistics):
                    self.characterStatistics = characterStatistics
                }
            }
        //2v2
            self.fetchCurrent2v2Rating(name: name, realm: realm) { result in
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    
                case .success(let pvp):
                    self.current2v2 = pvp
                }
            }
        //3v3
            self.fetchCurrent3v3Rating(name: name, realm: realm) { result in
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    
                case .success(let pvp):
                    self.current3v3 = pvp
                }
            }
        //rbg
            self.fetchCurrentRBGRating(name: name, realm: realm) { result in
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    
                case .success(let pvp):
                    self.currentRBG = pvp
                }
            }
        }
    }
    
    //MARK: - Fetch Functions
    
    //current character gear
    func fetchEquipment(name: String, realm realmSlug: String, completion: @escaping (Result<CharacterEquipmentSummary, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/equipment"
        jsonManager.performRequest(with: url, completion: completion)
    }
    
    //highest pvp ratings - stats
    func fetchAchievementStatistics(name: String, realm realmSlug: String, completion: @escaping (Result<CharacterAchievementStatistics, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/achievements/statistics"
        jsonManager.performRequest(with: url, completion: completion)
    }
    
    //current pvp rating - 2v2
    func fetchCurrent2v2Rating(name: String, realm realmSlug: String, completion: @escaping (Result<PvP, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/pvp-bracket/2v2"
        jsonManager.performRequest(with: url, completion: completion)
    }
    
    //current pvp rating - 3v3
    func fetchCurrent3v3Rating(name: String, realm realmSlug: String, completion: @escaping (Result<PvP, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/pvp-bracket/3v3"
        jsonManager.performRequest(with: url, completion: completion)
    }
    
    //current pvp rating - rbg
    func fetchCurrentRBGRating(name: String, realm realmSlug: String, completion: @escaping (Result<PvP, Error>) -> ()) {
        let url = "https://us.api.blizzard.com/profile/wow/character/\(realmSlug)/\(name)/pvp-bracket/rbg"
        jsonManager.performRequest(with: url, completion: completion)
    }

    //item info - icon image
    func fetchItemInfo() {
        
    }
}


