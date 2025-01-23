//
//  Step.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-02.
//

import Foundation

enum StepType: String {
    case half = "Half Step"
    case whole = "Whole Step"
    case chromaticHalf = "Chromatic HS"
    case diatonicHalf = "Diatonic HS"
}

struct Step: Equatable {
    let root: Note
    let step: Note
    
    let answer: StepType
    
    init(_ root: Note, _ step: Note, _ answer: StepType) {
        self.root = root
        self.step = step
        self.answer = answer
    }
}
