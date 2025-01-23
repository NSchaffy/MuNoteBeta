//
//  GameTopBarView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-06.
//

import SwiftUI

struct GameTopBarView: View {
    //for settings and main tutorial
    @StateObject var vc = ViewController.vc
    @StateObject var gc = GameViewController.gc
    @StateObject var ud = UserData.shared

    var width: CGFloat
    var height: CGFloat
    
    var shadowRadius: CGFloat = 2
    var cornerRadius: CGFloat {
        width/40
    }
    
    var body: some View {
        HStack(alignment: .top) {
//Back button
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.shadow(.inner(radius: shadowRadius)))
                .foregroundColor(.mDgrey)
                .overlay {
                    Button("Back") {
                        gc.currentGame = nil
                    }
                    .font(MFont().getFont(type: .fSSub, height: height))
                    .foregroundColor(.mText)
                }
                .frame(width: width/8, height: height/8)
            
            Spacer()
            
//Titles
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.mTitle)
                .overlay {
                    Text(gc.games[gc.currentGame ?? 0].name)
                        .foregroundColor(.mText)
                        .font(MFont().getFont(type: .fSub, height: height))
                }
                .frame(width: width/3.5, height: height/7)
            Spacer()
            
//Blue Button
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.shadow(.inner(radius: shadowRadius)))
                .foregroundColor(.mSubtitle)
                .overlay {
                    Button("Tutorial") {
                        
                    }
                    .font(MFont().getFont(type: .fSSub, height: height))
                    .foregroundColor(.mText)
                }
                .frame(width: width/8, height: height/8)
            
//Notes
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.mGold)
                .overlay {
                    Text(String(ud.notesCurrency))
                        .foregroundColor(.mText)
                    + Text(Image(systemName: "music.note"))
                        .foregroundColor(.mText)
                }
                .font(MFont().getFont(type: .fSSub, height: height*1.1))
                .frame(width: width/8, height: height/8)
                .padding(.horizontal)
        }
        .padding()
        .padding(.vertical)
    }
}
