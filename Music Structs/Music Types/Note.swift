//
//  Note.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-13.
//

import Foundation

struct Note: Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.name == rhs.name && lhs.accidental == rhs.accidental && lhs.staffPosition == rhs.staffPosition &&  lhs.relativePosition == rhs.relativePosition
    }
    
    var name: NoteLetters
    var accidental: Accidental
    var staffPosition: Int
    var relativePosition: Int
    
    init(_ name: NoteLetters, _ accidental: Accidental, _ staffPosition: Int, _ relativePosition: Int) {
        self.name = name
        self.accidental = accidental
        self.staffPosition = staffPosition
        self.relativePosition = relativePosition
    }
    
    var formattedName: String {
        return name.rawValue + " " + accidental.string.long
    }
    
    var formattedShortName: String {
        return name.rawValue + accidental.string.short
    }
    
    var answerString: String {
        return formattedName.replacingOccurrences(of: " ", with: "")
    }
}

extension Note {
    mutating func raise() {
        if accidental != .doubleSharp {
            if let index = Accidental.allValues.firstIndex(of: accidental) {
                accidental = Accidental.allValues[index + 1]
                relativePosition += 1
            }
        }
    }
    mutating func raiseby2() {
        if accidental != .sharp && accidental != .doubleSharp {
            if let index = Accidental.allValues.firstIndex(of: accidental) {
                accidental = Accidental.allValues[index + 2]
                relativePosition += 2
            }
        }
    }
    mutating func lower() {
        if accidental != .doubleFlat {
            if let index = Accidental.allValues.firstIndex(of: accidental) {
                accidental = Accidental.allValues[index - 1]
                relativePosition -= 1
            }
        }
    }
    mutating func lowerby2() {
        if accidental != .flat && accidental != .doubleFlat {
            if let index = Accidental.allValues.firstIndex(of: accidental) {
                accidental = Accidental.allValues[index - 2]
                relativePosition -= 2
            }
        }
    }
}

extension Note {
    mutating func octaveUp() {
        if staffPosition <= 44 && relativePosition <= 75 {
            staffPosition += 7
            relativePosition += 12
        }
    }
    mutating func octaveDown() {
        if staffPosition >= 7 && relativePosition >= 12 {
            staffPosition -= 7
            relativePosition -= 12
        }
    }
}

extension Note {
    var clef: Clef {
        let clefs = [Clefs.treble, Clefs.bass]
        if Clefs.treble.range.contains(staffPosition) && Clefs.bass.range.contains(staffPosition) {
            return clefs.randomElement() ?? Clefs.treble
        }
        if Clefs.treble.range.contains(staffPosition) { return Clefs.treble }
        if Clefs.bass.range.contains(staffPosition) { return Clefs.bass }
        
        return Clefs.none
    }
}

//staff Positions: 52 (0-51)
//relative positions: 88 (0-87)
enum NoteLetters: String {
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
    case E = "E"
    case F = "F"
    case G = "G"
}

