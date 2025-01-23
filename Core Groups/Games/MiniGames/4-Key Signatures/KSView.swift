//
//  KeySignaturesView.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-13.
//

import SwiftUI

struct KSView: View {
    @ObservedObject var ksc = KSController()
    
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
                                KeyStaffView(width: geos.size.width/3.5, height: getHeight(height: geos.size.height*0.9), key: ksc.key, clef: ksc.clef)
                                if !ksc.keyString.isEmpty {
                                    RoundedRectangle(cornerRadius: geos.size.height*0.2)
                                        .fill(Color.mTitle)
                                        .overlay {
                                            Text(ksc.keyString)
                                                .foregroundColor(.mText)
                                                .bold()
                                        }
                                        .padding(.horizontal)
                                        .frame(width: geos.size.width/6, height: geos.size.height*0.7)
                                    
                                }
                                Spacer()
                            }
                            .frame(width: geos.size.width, height: geos.size.height)
                        }
                        .padding(.bottom)
                        
                        HStack {
                            ForEach(0..<ksc.nButtons.count, id: \.self) { i in
                                NoteButton(button: ksc.nButtons[i], font: MFont().getFont(type: .bold, height: geo.size.height, divisor: 15))
                                    .onTapGesture {
                                        ksc.checkAnswer(aButton: nil, nButton: ksc.nButtons[i])
                                    }
                            }
                        }
                        .padding(.top)
                        .frame(width: geo.size.width/1.5, height: geo.size.height/5.5)
                        
                        HStack {
                            ForEach(0..<ksc.aButtons.count, id: \.self) { i in
                                AccidentalButton(button: ksc.aButtons[i], font: MFont().getFont(type: .bold, height: geo.size.height, divisor: 18))
                                    .onTapGesture {
                                        ksc.checkAnswer(aButton: ksc.aButtons[i], nButton: nil)
                                    }
                            }
                        }
                        .padding(.top)
                        .frame(width: geo.size.width/3.5, height: geo.size.height/5.5)
                    }
                    .padding()
                }
                
                GameTopBarView(width: geo.size.width, height: geo.size.height)
                
                if GameViewController.gc.showModes {
                    ModeChangeView(width: geo.size.width, height: geo.size.height, game: ksc.game)
                } else {
                    ModeChangeBar(width: geo.size.width, height: geo.size.height, game: ksc.game)
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

