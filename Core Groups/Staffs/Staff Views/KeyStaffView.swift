//
//  KeyStaffView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-15.
//

import SwiftUI

struct KeyStaffView: View {
    var width: CGFloat
    var height: CGFloat
    var key: KeySignature
    var clef: Clef
    
    var body: some View {
        ZStack {
            BaseStaffView(clef: clef, width: width, height: height)
            
            HStack(spacing:0) {
                ClefSpaceView(height: height)

                KeySigStaffLayer(key: key, clef: clef, width: width, height: height)

                Spacer()
            }.frame(maxWidth: width, minHeight: height*1.5, maxHeight: height*1.5)
            
            HStack {
                ClefView(clef: clef.name, height: height)
                Spacer()
            }.frame(maxWidth: width)
        }
    }
}
