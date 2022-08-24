//
//  FontAndBackground.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/23/22.
//

import SwiftUI

struct FontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
    }
}

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background()
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
        let background = Color("backgroundColor")
        let text = Color("textColor")
        let picker = Color("pickerColor")
    }
}
