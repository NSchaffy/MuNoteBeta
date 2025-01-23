//
//  KeySignaturesModel.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-13.
//

import Foundation

struct KSModel {
    let game = 4
    
    private var amount: Int {
        return GameViewController.gc.games[game].currentMode.number + GameViewController.gc.games[game].difficulty
    }
    
    static var beginner: [NoteStruct] = [NS.c, NS.g, NS.f, NS.d, NS.bb, NS.a, NS.eb]
    static var mezzo: [NoteStruct] = [NS.c, NS.g, NS.f, NS.d, NS.bb, NS.a, NS.eb, NS.e, NS.ab, NS.b, NS.db, NS.fs, NS.gb, NS.cs, NS.cb]
    static var maestro: [NoteStruct] = [NS.a, NS.e, NS.d, NS.b, NS.g, NS.fs, NS.c, NS.cs, NS.f, NS.gs, NS.bb, NS.ds, NS.eb, NS.aS, NS.ab]
    
    private(set) var key: KeySignature = beginner[0].majKey
    private(set) var quality: String = Quality.Major.rawValue
    private(set) var clef: Clef = Clefs.treble
    
    var accidentalIndex: Int? = nil
    var noteIndex: Int? = nil
    //correct x found
    var CoAcFo = false
    var CoNoFo = false
    
    mutating func checkAnswer(aButton: AccidentalGuessButton?, nButton: NoteGuessButton?) -> Bool {
        if aButton != nil {
            for i in 0..<aButtons.count {
                aButtons[i].isSelected = false
            }
            if let chosenAIndex = aButtons.firstIndex(where: { $0.id == aButton?.id }), !aButtons[chosenAIndex].isCorrect, !aButtons[chosenAIndex].hasBeenGuessed, !CoAcFo {
                accidentalIndex = chosenAIndex
                aButtons[chosenAIndex].isSelected = true
            }
        }
        
        if nButton != nil {
            for i in 0..<nButtons.count {
                nButtons[i].isSelected = false
            }
            if let chosenNIndex = nButtons.firstIndex(where: { $0.id == nButton?.id }), !nButtons[chosenNIndex].isCorrect, !nButtons[chosenNIndex].hasBeenGuessed, !CoNoFo {
                noteIndex = chosenNIndex
                nButtons[chosenNIndex].isSelected = true
            }
        }
        
        if let note = noteIndex, let accidental = accidentalIndex {
            if nButtons[note].name + aButtons[accidental].accidental.string.long + quality == key.answer {
                nButtons[note].isCorrect = true
                aButtons[accidental].isCorrect = true
                UserData.shared.increaseNotes(by: amount)
                UserData.shared.increaseStatus(by: amount)
                return true
            } else if key.answer.contains(nButtons[note].name) {
                nButtons[note].isCorrect = true
                aButtons[accidental].isSelected = false
                aButtons[accidental].hasBeenGuessed = true
                CoNoFo = true
            } else if key.answer.contains(aButtons[accidental].accidental.string.long) {
                aButtons[accidental].isCorrect = true
                nButtons[note].isSelected = false
                nButtons[note].hasBeenGuessed = true
                CoAcFo = true
            } else {
                nButtons[note].isSelected = false
                nButtons[note].hasBeenGuessed = true
                aButtons[accidental].isSelected = false
                aButtons[accidental].hasBeenGuessed = true
            }
        }
        return false
    }
    
    mutating func newKey() {
        let tempKey = key
        let clefs = [Clefs.treble, Clefs.bass]

        while(key == tempKey) {
            switch GameViewController.gc.games[game].currentMode {
            case GameModes.mezzo:
                clef = clefs.randomElement() ?? Clefs.treble
                key = (KSModel.mezzo.randomElement() ?? NS.c).majKey
                quality = Quality.Major.rawValue
            case GameModes.maestro:
                clef = clefs.randomElement() ?? Clefs.bass
                let ran = Int.random(in: 0...2)
                if ran == 0 {
                    key = (KSModel.mezzo.randomElement() ?? NS.c).majKey
                    quality = Quality.Major.rawValue
                } else {
                    key = (KSModel.maestro.randomElement() ?? NS.a).minKey
                    quality = Quality.Minor.rawValue
                }
            default: //beginner
                clef = Clefs.treble
                key = ( KSModel.beginner.randomElement() ?? NS.c).majKey
                quality = Quality.Major.rawValue
            }
        }
        for num in 0...6 {
            nButtons[num].hasBeenGuessed = false
            nButtons[num].isCorrect = false
            nButtons[num].isSelected = false
        }
        for num in 0...2 {
            aButtons[num].hasBeenGuessed = false
            aButtons[num].isCorrect = false
            aButtons[num].isSelected = false
        }
        accidentalIndex = nil
        noteIndex = nil
        CoAcFo = false
        CoNoFo = false
    }

    var aButtons: [AccidentalGuessButton] = [AccidentalGuessButton(id: 0, accidental: .flat), AccidentalGuessButton(id: 1, accidental: .natural), AccidentalGuessButton(id: 2, accidental: .sharp)]
    var nButtons: [NoteGuessButton] = [NoteGuessButton(id: 0, name: "A"), NoteGuessButton(id: 1, name: "B"), NoteGuessButton(id: 2, name: "C"), NoteGuessButton(id: 3, name: "D"), NoteGuessButton(id: 4, name: "E"), NoteGuessButton(id: 5, name: "F"), NoteGuessButton(id: 6, name: "G")]
    
    init() {
        newKey()
    }
}
