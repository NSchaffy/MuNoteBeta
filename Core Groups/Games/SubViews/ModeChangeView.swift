//
//  GameModeChangeView.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-06.
//

import SwiftUI

struct ModeChangeView: View {
    var width: CGFloat
    var height: CGFloat
    var game: Int

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                RoundedRectangle(cornerRadius: height/20)
                    .foregroundColor(.mLgrey)
                    .overlay {
                        VStack {
                            ForEach(GameViewController.gc.games[game].gameModes, id: \.self) { mode in
                                Capsule()
                                    .fill(mode.color)
                                    .overlay { Text(mode.name) }
                                    .foregroundColor(.mText)
                                    .bold()
                                    .onTapGesture {
                                        GameViewController.gc.games[game].currentMode = mode
                                        GameViewController.gc.showModes = false
                                    }
                                    .opacity(GameViewController.gc.games[game].currentMode == mode ? 1 : 0.5)
                                    .frame(width: width/6, height: height/8)
                            }
                        }.padding()
                    }
                    .frame(width: width/5, height: height*0.5)
            }
            Spacer()
        }.edgesIgnoringSafeArea(.trailing)
    }
}

struct ModeChangeBar: View {
    var width: CGFloat
    var height: CGFloat
    var game: Int
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: height/30)
                    .foregroundColor(GameViewController.gc.games[game].currentMode.color)
                    .frame(width: width*0.09, height: height*0.5)
                    .overlay {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.mText)
                            .bold()
                            .frame(width: width/20)
                            .padding()
                    }
                    .onTapGesture {
                        GameViewController.gc.showModes = true
                    }
                Spacer()
            }
        }.edgesIgnoringSafeArea(.trailing)
    }
}
