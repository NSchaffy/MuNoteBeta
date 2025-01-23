//
//  Font.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-04.
//

import SwiftUI

struct MFont {
    func getFont(type: FontType, height: CGFloat, divisor: CGFloat = 0) -> Font {
        switch type {
        case .fTitle:
            return Font.custom("Laila-SemiBold", size: height/7)
        case .fSub:
            return Font.custom("FiraSans-Medium", size: height/14)
        case .fCSub:
            return Font.custom("FiraSans-Medium", size: height/divisor)
        case .fSSub:
            return Font.custom("FiraSans-Regular", size: height/20)
        case .fText:
            return Font.custom("FiraSans-Regular", size: height/24)
        case .bold:
            return Font.custom("FiraSans-Bold", size: height/divisor)
        }
    }
}

enum FontType {
    case fTitle
    case fSub
    case fCSub
    case fSSub
    case fText
    case bold
}
