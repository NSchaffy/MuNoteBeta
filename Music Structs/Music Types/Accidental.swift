//
//  Accidental.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-14.
//

import Foundation

// ♯ ♯
// ♭ ♭
// ♮ ♮
enum Accidental {
    case doubleFlat
    case flat
    case natural
    case sharp
    case doubleSharp
    
    static let allValues = [doubleFlat, flat, natural, sharp, doubleSharp]
    
    var string: (short: String, long: String) {
        switch self {
        case .doubleFlat:
            return ("𝄫", "DoubleFlat")
        case .flat:
            return ("♭", "Flat")
        case .natural:
            return ("", "Natural")
        case .sharp:
            return ("♯", "Sharp")
        case .doubleSharp:
            return ("𝄪", "DoubleSharp")
        }
    }
}

