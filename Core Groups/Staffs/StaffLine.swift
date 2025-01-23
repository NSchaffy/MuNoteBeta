//
//  StaffLine.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-04.
//

import SwiftUI

struct StaffLine: Shape {
    var width: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX - width/2, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + width/2, y: rect.midY))

        return path
    }
}
