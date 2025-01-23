//
//  NoteView.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-04.
//

import SwiftUI

struct NoteView: View {
    var height: CGFloat
    var note: Note
    var isSecond = false
    var withNatural: Bool = false
    var key: KeySignature
    var isNaturalInKey: Bool {
        var rno = note
        rno.raise()
        var lno = note
        lno.lower()
        let ke = key.getNotes()
        return (note.accidental == Accidental.natural && (ke.contains(rno) || ke.contains(lno)))
    }
    
    var body: some View {
        HStack {
            if isNaturalInKey {
                Text("♮")
            } else if withNatural {
                Text("♮")
            } else if note.accidental == .natural || key.getNotes().contains(note) {
                Text("♮").opacity(0)
            } else {
                Text(note.accidental.string.short).font(.system(size: height/6))
            }
            if isSecond { Circle().frame(height: height/6).opacity(0) }
            Circle()
                .stroke(lineWidth: height/40)
                .frame(height: height/10)
                .overlay {
                    if note.staffPosition % 2 == 0 {
                        StaffLine(width: height/5).stroke()
                    }
                }
            if isNaturalInKey {
                Text("♮").opacity(0)
            } else if note.accidental == .natural || key.getNotes().contains(note) {
                Text("♮").opacity(0)
            } else {
                Text(note.accidental.string.short).font(.system(size: height/6)).opacity(0)
            }
        }
        .foregroundColor(Color.mBlack)
        .frame(height: height/15)
    }
}
