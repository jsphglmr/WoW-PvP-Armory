//
//  LoadingView.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/20/22.
//

import SwiftUI

struct LoadingView: View {
    
    
    var body: some View {
        ZStack{
            Color.ui.background.ignoresSafeArea()
            VStack{
                Text("loading")
                    .font(.sfMonoBold(size: 24))
                    .foregroundColor(Color.ui.text)
                LoadingSpinner()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
