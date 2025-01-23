//
//  NoteNamingOneView.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-11.
//

import SwiftUI

struct NN1View: View {
    @ObservedObject var nn1c = NN1Controller()
    
    var body: some View {
        ZStack {
            Color.mBackground.ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    TopBarFiller(width: geo.size.width, height: geo.size.height)
                    VStack(spacing: 0) {
                        GeometryReader { geos in
                            ZStack {
                                SingleNoteStaffView(width: geos.size.width/3, height: getHeight(height: geos.size.height*0.8), clef: nn1c.clef, note: nn1c.note)
                            }
                            .frame(width: geos.size.width, height: geos.size.height)
                        }
                        .padding(.bottom)
                        
                        HStack {
                            ForEach(0..<nn1c.buttons.count, id: \.self) { i in
                                NoteButton(button: nn1c.buttons[i], font: MFont().getFont(type: .bold, height: geo.size.height, divisor: 15))
                                    .onTapGesture {
                                        nn1c.checkAnswer(button: nn1c.buttons[i])
                                    }
                            }
                        }
                        .padding(.top)
                        .frame(width: geo.size.width/1.5, height: geo.size.height/4.5)
                    }
                    .padding()
                }
                
                GameTopBarView(width: geo.size.width, height: geo.size.height)
                
                if GameViewController.gc.showModes {
                    ModeChangeView(width: geo.size.width, height: geo.size.height, game: nn1c.game)
                } else {
                    ModeChangeBar(width: geo.size.width, height: geo.size.height, game: nn1c.game)
                }
            }
        }
    }
    
    func getHeight(height: CGFloat) -> CGFloat {
        if height > 300 {
            return height/2
        } else {
            return height
        }
    }
}
