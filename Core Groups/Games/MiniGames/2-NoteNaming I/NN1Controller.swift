//
//  NN1Controller.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-11.
//

import Foundation

class NN1Controller: ObservableObject {
    @Published private var model = NN1Model()
    
    var buttons: Array<NoteGuessButton> {
        return model.buttons
    }
    
    var note: Note {
        return model.note
    }
    var clef: Clef {
        return model.clef
    }
    var game: Int {
        return model.game
    }
    
    func checkAnswer(button: NoteGuessButton) {
        let nn = model.checkAnswer(button: button)
        if nn {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.model.newNote()
            }
        }
    }
}
