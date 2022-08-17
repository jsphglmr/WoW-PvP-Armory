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
        Image(imageName)
            .resizable()
            .frame(width: 50, height: 50, alignment: .leading)
            .overlay(Rectangle().stroke(Color.purple, lineWidth: 5))
    }
}
