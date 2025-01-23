//
//  Clef.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-05.
//

import Foundation

struct Clefs {
    static var treble = Clef("TrebleClef", 14...30, 14, 30, 0) //C6-A3
    static var bass = Clef("BassClef", 26...42, 26, 42, 14) //E4-C2
    
    static var none = Clef("None", 0...0, 0, 0, 0)
    static var clefs = [treble, bass]
}

struct Clef: Equatable {
    let name : String
    let range: ClosedRange<Int>
    let lowerBound: Int
    let upperBound: Int
    let offset: Int
    
    init(_ name: String, _ range: ClosedRange<Int>, _ lowerBound: Int, _ upperBound: Int, _ offset: Int) {
        self.name = name
        self.range = range
        self.lowerBound = lowerBound
        self.upperBound = upperBound
        self.offset = offset
    }
}

//enum Clef {
//    case treble
//    case bass
//    case alto
//    case tenor
//
//    case baritone
//    case soprano
//    case mezzoSoprano
//
//    case keyboard
//    case fretboard
//}
