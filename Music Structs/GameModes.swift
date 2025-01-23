//
//  Difficulties.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-01-31.
//
import SwiftUI

struct GameModes {
    static let beginner = GameMode(name: "Beginner", number: 1, color: .gMgreen)
    static let mezzo = GameMode(name: "Mezzo", number: 2, color: .gMorange)
    static let maestro = GameMode(name: "Maestro", number: 3, color: .gMred)
    static let extreme = GameMode(name: "Extreme", number: 5, color: .gMblue)
    
    static let piano = GameMode(name: "Piano", number: 1, color: .mBlack)
    static let string = GameMode(name: "Strings", number: 1, color: .gMbrown)
    
    static let gameModes = [beginner, mezzo, maestro]
    static let challengeModes = [beginner, mezzo, maestro, extreme]
}

struct GameMode: Equatable, Hashable {
    static func == (lhs: GameMode, rhs: GameMode) -> Bool {
        lhs.name == rhs.name && lhs.number == rhs.number && lhs.color == rhs.color
    }
    
    let name: String
    let number: Int
    let color: Color
    
    var totalCorrect = 0
    var highestInARow = 0
    
    init(name: String, number: Int, color: Color) {
        self.name = name
        self.number = number
        self.color = color
    }
}
