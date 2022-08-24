//
//  InfoView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/23/22.
//

import SwiftUI

struct InfoView: View {
    
    let info: String
    
    var body: some View {
        Text(info)
            .font(.sfMonoRegular(size: 16))
            .foregroundColor(Color.ui.text)
    }
}
