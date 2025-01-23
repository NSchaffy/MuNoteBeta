//
//  SteController.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-06.
//

import Foundation

class SteController: ObservableObject {
    @Published private var model = SteModel()
    
    var buttons: Array<StepGuessButton> {
        switch GameViewController.gc.games[game].currentMode {
        case GameModes.mezzo:
            return model.buttons.filter { $0.step != StepType.half.rawValue }
        case GameModes.maestro:
            return model.buttons.filter { $0.step != StepType.half.rawValue }
        default: //beginner
            return model.buttons.filter { $0.step != StepType.chromaticHalf.rawValue && $0.step != StepType.diatonicHalf.rawValue }
        }
    }
    
    var step: Step {
        return model.step
    }
    var clef: Clef {
        return model.clef
    }
    var game: Int {
        return model.game
    }
    
    func checkAnswer(button: StepGuessButton) {
        let st = model.checkAnswer(button: button)
        if st {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.model.newStep()
            }
        }
    }
}
