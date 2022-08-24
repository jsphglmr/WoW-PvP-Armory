//
//  ContentView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var characterSearch = CharacterSearch()
    @State var name: String = ""
    @State var realm: String = ""
    
    
    var body: some View {
        ZStack {
            Color.ui.background.ignoresSafeArea()

            VStack{
                Text("searchbar placeholder")
                    .font(.sfMonoRegular(size: 24))
                    .foregroundColor(.ui.text)
                
                Spacer()
            }
            
            if characterSearch.isLoading {
                LoadingView()
            } else if characterSearch.errorMessage != nil  {
                ErrorView(characterSearch: characterSearch)
            } else {
                CharacterEquipmentView(name: name, realm: realm)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
