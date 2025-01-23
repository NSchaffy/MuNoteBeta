//
//  Interval.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-05.
//

import Foundation

struct Interval: Equatable {
    let root: Note
    let interval: Note
    
    let answer: String
    
    init(_ root: Note, _ interval: Note, _ answer: String) {
        self.root = root
        self.interval = interval
        self.answer = answer
    }
    
    func staffDistance() -> Int {
        return root.staffPosition - interval.staffPosition
    }
    
    func relativeDistance() -> Int {
        return root.relativePosition - interval.relativePosition
    }
    
    func quality() -> Quality {
        return .Perfect
    }
    
    func inverse() -> Interval {
        return self
    }
}


