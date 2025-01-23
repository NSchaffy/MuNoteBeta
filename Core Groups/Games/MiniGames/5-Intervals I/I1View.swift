//
//  I1View.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-05.
//

import SwiftUI

struct I1View: View {
    @ObservedObject var i1c = I1Controller()
    
    var body: some View {
        ZStack {
            Color.mBackground.ignoresSafeArea()
            
            GeometryReader { geo in
                VStack {
                    TopBarFiller(width: geo.size.width, height: geo.size.height)
                    VStack(spacing: 0) {
                        GeometryReader { geos in
                            ZStack {
                                IntervalStaffView(width: geos.size.width/3, height: getHeight(height: geos.size.height*0.8), clef: i1c.clef, interval: i1c.interval, key: i1c.key, ns: i1c.ns, withKey: (!i1c.qButtons.isEmpty))
                            }
                            .frame(width: geos.size.width, height: geos.size.height)
                        }
                        .padding(.bottom)
                        
                        HStack {
                            ForEach(0..<i1c.qButtons.count, id: \.self) { i in
                                QualityButton(button: i1c.qButtons[i], font: MFont().getFont(type: .bold, height: geo.size.height, divisor: 15))
                                    .onTapGesture {
                                        i1c.checkAnswer(qButton: i1c.qButtons[i], dButton: nil)
                                    }
                            }
                        }
                        .padding(.top)
                        .frame(width: geo.size.width/1.75, height: i1c.qButtons.isEmpty ? 0 : geo.size.height/6)
                        
                        HStack {
                            ForEach(0..<i1c.dButtons.count, id: \.self) { i in
                                DistanceButton(button: i1c.dButtons[i], font: MFont().getFont(type: .bold, height: geo.size.height, divisor: 15))
                                    .onTapGesture {
                                        i1c.checkAnswer(qButton: nil, dButton: i1c.dButtons[i])
                                    }
                            }
                        }
                        .padding(.top)
                        .frame(width: geo.size.width/1.7, height: i1c.qButtons.isEmpty ? geo.size.height/5 : geo.size.height/6)
                    }
                    .padding()
                }
                
                GameTopBarView(width: geo.size.width, height: geo.size.height)
                
                if GameViewController.gc.showModes {
                    ModeChangeView(width: geo.size.width, height: geo.size.height, game: i1c.game)
                } else {
                    ModeChangeBar(width: geo.size.width, height: geo.size.height, game: i1c.game)
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

