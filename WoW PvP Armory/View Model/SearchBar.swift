//
//  SearchBar.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/16/22.
//

import SwiftUI

struct SearchBar: View {
    
    let servers = ["server1", "server2", "server3", "server4", "server5", "server6", "server7", "server8"]
    
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            List {
              ForEach(searchQuery == "" ? servers: servers.filter { $0.contains(searchQuery)}, id: \.self) { server in
                    Text(server)
                }
                .navigationTitle("Servers")
            }
          .searchable(text: $searchQuery)
        }
    }
}
