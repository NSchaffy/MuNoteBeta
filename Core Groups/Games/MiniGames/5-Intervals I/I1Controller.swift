//
//  I1Controller.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-05.
//

import Foundation

class I1Controller: ObservableObject {
    @Published private var model = I1Model()
    
    var qButtons: Array<QualityGuessButton> {
        switch GameViewController.gc.games[game].currentMode {
        case GameModes.mezzo:
            return model.qButtons.filter { $0.id != 0 && $0.id != 4 }
        case GameModes.maestro:
            return model.qButtons
        default: //beginner
            return []
        }
    }

    var dButtons: Array<DistanceGuessButton> {
        return model.dButtons
    }
    
    var interval: Interval {
        return model.interval
    }
    var key: KeySignature {
        return model.ns.majKey
    }
    var ns: NoteStruct {
        return model.ns
    }
    var clef: Clef {
        return model.clef
    }
    var game: Int {
        return model.game
    }
    
    func checkAnswer(qButton: QualityGuessButton?, dButton: DistanceGuessButton?) {
        let ni = model.checkAnswer(qButton: qButton, dButton: dButton)
        if ni {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.model.newInterval()
            }
        }
    }
}
