//
//  ItemView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/16/22.
//

import SwiftUI

struct ItemView: View {
    
    let imageName: String
    
    var body: some View {
        Button(action: {
          print("button pressed")
            // code to open gear info
            
        }) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .overlay(Rectangle().stroke(lineWidth: 4))
        }
    }
}
