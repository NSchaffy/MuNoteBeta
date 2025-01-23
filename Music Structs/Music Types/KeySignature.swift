//
//  KeySignature.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-04.
//

import Foundation

struct KeySignature: Equatable {
    let type: Accidental
    let number: Int
    let answer: String
    
    init(_ type: Accidental, _ number: Int, _ answer: String) {
        self.type = type
        self.number = number
        self.answer = answer
    }
    
    func getPositions(for clef: Clef) -> [Int] {
        let arr = getNotes()
        let farr = arr.map { $0.staffPosition + clef.offset }
        return farr
    }
    
    func getNotes() -> [Note] {
        var sharps = [N.f5, N.c5, N.g5, N.d5, N.a4, N.e5, N.b4]
        var flats = [N.b4, N.e5, N.a4, N.d5, N.g4, N.c5, N.f4]
        
        var arr: [Note] {
            if type == .sharp {
                for var i in 0..<number {
                    if i > 6 { i -= 7 }
                    sharps[i].raise()
                }
                if number < 7 {
                    for _ in 0..<(7-number) {
                        sharps.removeLast()
                    }
                }
                return sharps
            } else if type == .flat {
                for var i in 0..<number {
                    if i > 6 { i -= 7 }
                    flats[i].lower()
                }
                if number < 7 {
                    for _ in 0..<(7-number) {
                        flats.removeLast()
                    }
                }
                return flats
            } else {
                return []
            }
        }
        return arr
    }
}
