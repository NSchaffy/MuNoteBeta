//
//  Record.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-01-30.
//

import SwiftUI

struct Record {
    var title: String
    var color: Color
    var icon: String
    
    let dateStarted: Date
    
    var numOfMusicians: Int
    var solo: RecordMusician?
    var musicians: [RecordMusician]
}

struct RecordMusician {
    var musician: Musician
    
}

struct Instrument {
    
}
