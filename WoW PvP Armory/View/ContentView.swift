//
//  ContentView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("searchbar placeholder")
              .font(.sfMonoMedium(size: 28))
            
            Spacer()
        }
          
        
        
//          if characterView.isLoading {
//              LoadingView()
//          }else if characterView.errorMessage != nil  {
//              ErrorView(characterView: breedFetcher)
//          }else {
//              CharacterEquipmentView()
//          }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
