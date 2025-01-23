//
//  GameViewController.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-01-31.
//

import SwiftUI

class GameViewController: ObservableObject {
    static let gc = GameViewController()
    static let gm  = GameModes.self
    
    @Published var showModes = false
    @Published var currentGame: Int? = nil
    
    @Published var games: [Game] = [
        Game("Finger Numbers",  1, nil,             GameColours.FN,     [gm.piano, gm.string]),
        Game("Symbols I",       1, nil,             GameColours.ST,     [gm.beginner, gm.mezzo, gm.maestro]),
        Game("Note Naming I",   2, "Symbols I",     GameColours.NN1,    [gm.beginner, gm.mezzo, gm.maestro]),
        Game("Steps",           2, "Note Naming I", GameColours.Ste,    [gm.beginner, gm.mezzo, gm.maestro]),
        Game("Key Signatures",  3, "Note Naming I", GameColours.KS,     [gm.beginner, gm.mezzo, gm.maestro]),
        Game("Intervals I",     4, "Key Sigs",      GameColours.I1,     [gm.beginner, gm.mezzo, gm.maestro])
    ]
}

struct Game {
    let name: String
    let difficulty: Int
    
    let recommended: String?
    let colours: [Color]
    
    let gameModes: [GameMode]
    
    init(_ name: String, _ difficulty: Int, _ recommended: String?, _ colours: [Color], _ gameModes: [GameMode]) {
        self.name = name
        self.difficulty = difficulty
        self.recommended = recommended
        self.colours = colours
        self.gameModes = gameModes
    }
    //for use, currentGame.currentMode = .beginner
    //This makes the side bar much more simple to use
    var currentMode: GameMode = GameModes.beginner
}
