//
//  GameButtonView.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-08.
//

import SwiftUI

struct GameButtonView: View {
    @StateObject var gc: GameViewController
    var game: Int
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        let difficulty = gc.games[game].difficulty
        let gameString = gc.games[game].name
        let recommended = gc.games[game].recommended
        let colours = gc.games[game].colours
        RoundedRectangle(cornerRadius: width/10)
            .fill(.shadow(.inner(radius: 2.5)))
            .foregroundStyle(LinearGradient(colors: colours, startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay {
                VStack(spacing: 0) {
                    Spacer()
                    HStack {
                        Recommended(recommended: recommended, height: height)
                        Spacer()
                    }
                    Spacer()
                    Text(gameString)
                        .font(MFont().getFont(type: .bold, height: height, divisor: 5))
                        .foregroundColor(.mText)
                    Spacer()
                    HStack {
                        Spacer()
                        DifficultyRating(difficulty: difficulty, width: width)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
            }
            .frame(width: width, height: height*0.95)
            .padding()
            .onTapGesture {
                gc.currentGame = game
            }
    }
}

struct DifficultyRating: View {
    var difficulty: Int
    var width: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<difficulty, id: \.self) {_ in
                Image(systemName: "music.note")
                    .foregroundColor(.mText)
                    .bold()
                    .padding(2)
            }
        }
        .padding(.horizontal, width/35)
        .background(Color.mGrey.opacity(0.3).clipShape(Capsule()))
    }
}

struct Recommended: View {
    var recommended: String?
    var height: CGFloat
    
    var body: some View {
        if let recommended = recommended {
            HStack(spacing: 0) {
                Image("Recommended").symbolRenderingMode(.palette).foregroundStyle(Color.mLgrey, .red)
                    .padding(2)
                    .padding(.horizontal, height/90)
                Text(recommended)
                    .font(MFont().getFont(type: .fCSub, height: height, divisor: 8))
                    .padding(2)
                    .padding(.horizontal, height/90)
                    .foregroundColor(.mText)
            }
            .background(Color.mGrey.opacity(0.2).clipShape(Capsule()))
            .padding(.horizontal)
        } else {
            HStack {
                Text("")
                    .font(MFont().getFont(type: .fCSub, height: height, divisor: 8))
                    .padding(2)
                    .foregroundColor(.mText)
                Image("Recommended").symbolRenderingMode(.palette).foregroundStyle(Color.mSubtitle, .red)
                    .padding(2)
            }
            .background(Color.mLgrey.opacity(0.4).clipShape(Capsule()))
            .padding(.horizontal)
            .opacity(0)
        }
    }
}
