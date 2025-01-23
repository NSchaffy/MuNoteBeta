//
//  SteModel.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-06.
//

import Foundation


/*
 var root = N.allnotes.randomel
 var step: Note
 switch stepType {
 case whole:
 var step = N.allnotes.filter { $0.staffposition + 1, relativeposition+2 }
 */

struct SteModel {
    let game = 3
    
    private var amount: Int {
        return GameViewController.gc.games[game].currentMode.number + GameViewController.gc.games[game].difficulty
    }
    
    private(set) var step: Step = Step(N.c4, N.d4, .whole)
    private(set) var clef: Clef = Clefs.treble
    
    mutating func checkAnswer(button: StepGuessButton) -> Bool {
        if let chosenIndex = buttons.firstIndex(where: { $0.id == button.id}), !buttons[chosenIndex].isCorrect, !buttons[chosenIndex].hasBeenGuessed {
            if buttons[chosenIndex].step == step.answer.rawValue {
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
    
    mutating func newStep() {
        let tempStep = step
        let clefs = [Clefs.treble, Clefs.bass]
        let beginnerSteps = [StepType.whole, StepType.half]
        let otherSteps = [StepType.whole, StepType.chromaticHalf, StepType.diatonicHalf]
        let mezzo: [Note] = [N.cb4, N.c4, N.cs4, N.db4, N.d4, N.ds4, N.eb4, N.e4, N.fb4, N.f4, N.fs4, N.gb4, N.g4, N.gs4, N.ab4, N.a4, N.aS4, N.bb4, N.b4, N.cb5, N.c5, N.cs5]

        while(step == tempStep) {
            switch GameViewController.gc.games[game].currentMode {
            case GameModes.mezzo:
                clef = Clefs.treble
                let stepType = otherSteps.randomElement() ?? StepType.whole
                step = getStep(stepType, notes: mezzo, clef: clef)
            case GameModes.maestro:
                clef = clefs.randomElement() ?? Clefs.bass
                let stepType = otherSteps.randomElement() ?? StepType.whole
                step = getStep(stepType, notes: N.singleAccUsefulNotes.filter { $0.answerString != "ESharp" && $0.answerString != "BSharp" }, clef: clef)
            default:
                clef = Clefs.treble
                let stepType = beginnerSteps.randomElement() ?? StepType.whole
                step = getStep(stepType, notes: NS.c.majorScale, clef: clef)
            }
        }
        
        for num in 0...3 {
            buttons[num].hasBeenGuessed = false
            buttons[num].isCorrect = false
        }
    }
    
    func getStep(_ stepType: StepType, notes: [Note], clef: Clef) -> Step {
        let root: Note
        let step: Note
        
        switch stepType {
        case .half:
            let notes = notes.filter { $0.staffPosition != clef.lowerBound && clef.range.contains($0.staffPosition - 1) && clef.range.contains($0.staffPosition) }
            root = notes.randomElement() ?? N.c4
        case .whole:
            let notes = notes.filter { $0.staffPosition != clef.lowerBound && clef.range.contains($0.staffPosition - 1) && clef.range.contains($0.staffPosition) }
            root = notes.randomElement() ?? N.c4
        case .chromaticHalf:
            let notes = notes.filter { $0.accidental != .sharp && $0.staffPosition != clef.lowerBound && clef.range.contains($0.staffPosition - 1) && clef.range.contains($0.staffPosition) }
            root = notes.randomElement() ?? N.c4
        case .diatonicHalf:
            let notes = notes.filter { $0.accidental != .flat && $0.staffPosition != clef.lowerBound && clef.range.contains($0.staffPosition - 1) && clef.range.contains($0.staffPosition) }
            root = notes.randomElement() ?? N.c4
        }
        
        let sta = root.staffPosition
        let rel = root.relativePosition
        
        //gets step note
        switch stepType {
        case .half:
            let notes = N().getNoteBy(relativePosition: rel - 1)
            step = notes.randomElement() ?? notes[0]
        case .whole:
            let notes = N().getNote(from: sta - 1, and: rel - 2)
            step = notes[0]
        case .chromaticHalf:
            let notes = N().getNote(from: sta, and: rel - 1)
            step = notes[0]
        case .diatonicHalf:
            let notes = N().getNote(from: sta - 1, and: rel - 1)
            step = notes[0]
        }

        return Step(root, step, stepType)
    }
    
    var buttons = [StepGuessButton(id: 0, step: StepType.half.rawValue), StepGuessButton(id: 1, step: StepType.whole.rawValue), StepGuessButton(id: 2, step: StepType.chromaticHalf.rawValue), StepGuessButton(id: 3, step: StepType.diatonicHalf.rawValue)]
    
    init() {
        newStep()
    }
}
