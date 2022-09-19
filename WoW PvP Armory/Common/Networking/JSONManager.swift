//
//  JSON Manager.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/17/22.
//

import SwiftUI

class JSONManager {
    
    var accessToken = ""
    
    //MARK: - Perform Request
    func performRequest<T:Decodable>(with urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = ["Authorization": "Bearer \(accessToken)"]
            
            let task = session.dataTask(with: request) {  data, response, error in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let safeData = data {
                    if let wowData = self.parseJSON(safeData) as T? {
                        completion(.success(wowData))
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON<T:Decodable>(_ wowData: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let decodedData = try decoder.decode(T.self, from: wowData)
            return decodedData
        }
        catch {
            print(error)
            return nil
        }
    }
}
