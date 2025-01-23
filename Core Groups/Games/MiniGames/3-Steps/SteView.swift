//
//  StView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-14.
//

import SwiftUI

struct SteView: View {
    let game = 3
    @ObservedObject var stec = SteController()
    
    var body: some View {
        ZStack {
            Color.mBackground.ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    TopBarFiller(width: geo.size.width, height: geo.size.height)
                    VStack(spacing: 0) {
                        GeometryReader { geos in
                            HStack {
                                Spacer()
                                StepStaffView(width: geo.size.width/3, height: getHeight(height: geos.size.height*0.8), clef: stec.clef, root: stec.step.root, step: stec.step.step, key: NS.c.majKey, withKey: true)
                                Spacer()
                            }
                            .frame(width: geos.size.width, height: geos.size.height)
                        }
                        .padding(.bottom)
                        
                        HStack {
                            ForEach(0..<stec.buttons.count, id: \.self) { i in
                                StepButton(button: stec.buttons[i], font: MFont().getFont(type: .bold, height: geo.size.height, divisor: 15))
                                    .onTapGesture {
                                        stec.checkAnswer(button: stec.buttons[i])
                                    }
                            }
                        }
                        .padding(.top)
                        .frame(width: (GameViewController.gc.games[game].currentMode == GameModes.beginner ? geo.size.width/2 : geo.size.width/1.4), height: geo.size.height/5)
                    }
                    .padding()
                }
                
                GameTopBarView(width: geo.size.width, height: geo.size.height)
                
                if GameViewController.gc.showModes {
                    ModeChangeView(width: geo.size.width, height: geo.size.height, game: stec.game)
                } else {
                    ModeChangeBar(width: geo.size.width, height: geo.size.height, game: stec.game)
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

