//
//  ClefView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-08.
//

import SwiftUI

struct ClefView: View {
    var clef: String
    var height: CGFloat
    
    var body: some View {
        switch clef {
        case "TrebleClef":
            Image(clef)
                .resizable()
                .frame(width: height/1.4, height: height*1.5)
                .padding(.vertical)
        case "BassClef":
            Image(clef)
                .resizable()
                .scaledToFit()
                .frame(width: height/1.5, height: height)
                .offset(y: -height/40)
                .padding(.vertical)
        default:
            Text("")
        }
    }
}

struct ClefSpaceView: View {
    var height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.clear)
            .frame(width: height/1.5, height: height*1.3)
    }
}
