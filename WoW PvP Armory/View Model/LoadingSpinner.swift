//
//  LoadingSpinner.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/21/22.
//

import SwiftUI

struct LoadingSpinner: View {
    var body: some View {
        Image(systemName: "gearshape.fill")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 50.0, height: 50.0)
            .foregroundColor(.ui.text)
    }
}

struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner()
    }
}
