//
//  ErrorView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/23/22.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var characterSearch: CharacterSearch
    var body: some View {
        VStack {
            //add searchbar to top ov vstack
            
            Text("ERROR!")
                .font(.system(size: 80))
            
            Text(characterSearch.errorMessage ?? "")
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(characterSearch: CharacterSearch())
    }
}
