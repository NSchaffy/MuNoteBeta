//
//  KeySignaturesController.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-13.
//

import Foundation

class KSController: ObservableObject {
    @Published private var model = KSModel()
    
    var nButtons: Array<NoteGuessButton> {
        return model.nButtons
    }
    var aButtons: Array<AccidentalGuessButton> {
        return model.aButtons
    }
    
    var key: KeySignature {
        return model.key
    }
    var keyString: String {
        switch GameViewController.gc.games[game].currentMode {
        case GameModes.mezzo:
            return ""
        case GameModes.maestro:
            return model.quality
        default: //beginner
            return ""
        }
    }
    var clef: Clef {
        return model.clef
    }
    var game: Int {
        return model.game
    }
    
    func checkAnswer(aButton: AccidentalGuessButton?, nButton: NoteGuessButton?) {
        let nk = model.checkAnswer(aButton: aButton, nButton: nButton)
        if nk {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.model.newKey()
            }
        }
    }
}
