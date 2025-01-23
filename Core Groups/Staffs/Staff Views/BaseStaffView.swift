//
//  BaseStaffView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-19.
//

import SwiftUI

struct BaseStaffView: View {
    var clef: Clef
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Color.mSand.opacity(0.2).frame(maxWidth: width*1.2, minHeight: height*1.5, maxHeight: height*1.5)

        VStack(spacing: 0) {
            ForEach(clef.lowerBound...clef.upperBound, id: \.self) { i in
                if i % 2 == 0 && i != clef.lowerBound && i != clef.lowerBound + 2 && i != clef.upperBound - 2 && i != clef.upperBound {
                    StaffLine(width: width).stroke(CSS().black)
                } else {
                    StaffLine(width: width)
                }
            }
        }.frame(maxWidth: width, minHeight: height*1.5, maxHeight: height*1.5)
    }
}
