//
//  NN1Model.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-11.
//

import Foundation

struct NN1Model {
    let game = 2
    
    private var amount: Int {
        return GameViewController.gc.games[game].currentMode.number + GameViewController.gc.games[game].difficulty
    }
    
    static var beginner: [Note] = [N.c4, N.d4, N.e4, N.f4, N.g4, N.a4, N.b4, N.c5]
    static var mezzo: [Note] = [N.c3, N.d3, N.e3, N.f3, N.g3, N.a3, N.b3, N.c3, N.c4, N.d4, N.e4, N.f4, N.g4, N.a4, N.b4, N.c5]
    static var maestro: [Note] = [N.c2, N.d2, N.e2, N.f2, N.g2, N.a2, N.b2, N.c3, N.d3, N.e3, N.f3, N.g3, N.a3, N.b3, N.c4, N.d4, N.e4, N.a3, N.b3, N.c4, N.d4, N.e4, N.f4, N.g4, N.a4, N.b4, N.c5, N.d5, N.e5, N.f5, N.g5, N.a5, N.b5, N.c6]
    private(set) var note: Note = N.c5
    private(set) var clef: Clef = Clefs.treble
    
    mutating func checkAnswer(button: NoteGuessButton) -> Bool {
        if let chosenIndex = buttons.firstIndex(where: { $0.id == button.id}), !buttons[chosenIndex].isCorrect, !buttons[chosenIndex].hasBeenGuessed {
            if buttons[chosenIndex].name == note.formattedShortName {
                buttons[chosenIndex].isCorrect = true
                UserData.shared.increaseNotes(by: amount)
                UserData.shared.increaseStatus(by: amount)
                return true
            } else {
                buttons[chosenIndex].hasBeenGuessed = true
            }
        }
        return false
    }
    
    mutating func newNote() {
        let tempNote = note
        while(note == tempNote) {
            switch GameViewController.gc.games[game].currentMode {
            case GameModes.mezzo:
                note = NN1Model.mezzo.randomElement() ?? N.c4
                clef = note.clef
            case GameModes.maestro:
                note = NN1Model.maestro.randomElement() ?? N.c4
                clef = note.clef
            default:
                note = NN1Model.beginner.randomElement() ?? N.c4
                clef = Clefs.treble
            }
        }
        
        for num in 0...6 {
            buttons[num].hasBeenGuessed = false
            buttons[num].isCorrect = false
        }
    }

    var buttons = [NoteGuessButton(id: 0, name: "A"), NoteGuessButton(id: 1, name: "B"), NoteGuessButton(id: 2, name: "C"), NoteGuessButton(id: 3, name: "D"), NoteGuessButton(id: 4, name: "E"), NoteGuessButton(id: 5, name: "F"), NoteGuessButton(id: 6, name: "G")]
    
    init() {
        newNote()
    }
}
