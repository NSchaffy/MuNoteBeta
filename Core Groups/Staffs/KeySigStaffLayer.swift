//
//  KeySigStaffLayer.swift
//  MuNoteBeta
//
//  Created by Account on 2023-03-23.
//

import SwiftUI

struct KeySigStaffLayer: View {
    var key: KeySignature
    var clef: Clef
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            let positions = key.getPositions(for: clef)
            ForEach(clef.lowerBound...clef.upperBound, id: \.self) { i in
                ZStack {
                    StaffLine(width: width)
                    if positions.contains(i) {
                        Text(key.type.string.short)
                            .foregroundColor(Color.mBlack)
                            .font(.system(size: height/4))
                            .frame(height: height/15)
                            .offset(x: CGFloat(positions.firstIndex(of: i)!)*height/6-height/4)
                    }
                }
            }
        }
    }
}
