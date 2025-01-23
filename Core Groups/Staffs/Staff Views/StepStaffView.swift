//
//  StepStaffView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-17.
//

import SwiftUI

struct StepStaffView: View {
    var width: CGFloat
    var height: CGFloat
    var clef: Clef
    var root: Note
    var step: Note
    var key: KeySignature
    var withKey: Bool
    
    var body: some View {
        ZStack {
            BaseStaffView(clef: clef, width: width, height: height)
            
            HStack(spacing:0) {
                ClefSpaceView(height: height)

                HStack {
                    SingleNoteStaffLayer(clef: clef, note: root, width: width, height: height)
                    SingleNoteStaffLayer(clef: clef, note: step, width: width, height: height, withNatural: (step.name == root.name && step.accidental == .natural))
                }
                
                Spacer()
            }.frame(maxWidth: width, minHeight: height*1.5, maxHeight: height*1.5)
            
            HStack {
                ClefView(clef: clef.name, height: height)
                Spacer()
            }.frame(maxWidth: width)
        }
    }
}
