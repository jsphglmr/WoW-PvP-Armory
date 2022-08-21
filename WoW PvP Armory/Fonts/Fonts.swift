//
//  Fonts.swift
//  WoW PvP Armory
//
//  Created by Joseph Gilmore on 8/21/22.
//

import SwiftUI

extension Font {
    
    static func sfMonoMedium(size: CGFloat) -> Font {
      return .custom("SFMono-Medium.otf", size: size)
    }
    
    static func sfMonoBold(size: CGFloat) -> Font {
      return .custom("SFMono-Bold.otf", size: size)
    }
    
    static func sfMonoRegular(size: CGFloat) -> Font {
      return .custom("SFMono-Regular.otf", size: size)
    }
}


