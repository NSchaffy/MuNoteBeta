//
//  SingleNoteStaffLayer.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-23.
//

import SwiftUI

struct SingleNoteStaffLayer: View {
    var clef: Clef
    var note: Note
    var width: CGFloat
    var height: CGFloat
    var key: KeySignature? = nil
    var withNatural: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(clef.lowerBound...clef.upperBound, id: \.self) { i in
                ZStack {
                    if note.staffPosition >= clef.upperBound - 2 && i == clef.upperBound - 2 {
                        StaffLine(width: height/5).stroke(CSS().black)
                    } else if note.staffPosition <= clef.lowerBound + 2 && i == clef.lowerBound + 2 {
                        StaffLine(width: height/5).stroke(CSS().black)
                    } else {
                        StaffLine(width: width)
                    }
                    
                    if note.staffPosition == i {
                        NoteView(height: height, note: note, withNatural: withNatural, key: key ?? NS.c.majKey)
                    }
                }
            }
        }
    }
}
