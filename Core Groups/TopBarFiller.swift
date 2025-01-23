//
//  TopBarFiller.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-10.
//

import SwiftUI

struct TopBarFiller: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(.clear)
            .frame(width: width, height: height/7)
            .padding(.vertical)
    }
}
