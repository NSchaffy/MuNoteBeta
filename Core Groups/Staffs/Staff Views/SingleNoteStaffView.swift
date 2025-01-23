//
//  SingleNoteStaffView.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-04.
//

import SwiftUI

struct SingleNoteStaffView: View {
    var width: CGFloat
    var height: CGFloat
    var clef: Clef
    var note: Note

    var body: some View {
        ZStack {
            BaseStaffView(clef: clef, width: width, height: height)
            
            HStack(spacing:0) {
                ClefSpaceView(height: height)

                SingleNoteStaffLayer(clef: clef, note: note, width: width, height: height)
                
                Spacer()
            }.frame(maxWidth: width, minHeight: height*1.5, maxHeight: height*1.5)
            
            HStack {
                ClefView(clef: clef.name, height: height)
                Spacer()
            }.frame(maxWidth: width)
        }
    }
}
