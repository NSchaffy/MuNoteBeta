//
//  GamesPage.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-11.
//

import SwiftUI

struct GamesPage: View {
    @StateObject var vc = ViewController.vc
    @StateObject var gc = GameViewController.gc

    var body: some View {
        ZStack {
            Color.mBackground.ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    TopBarFiller(width: geo.size.width, height: geo.size.height)
                        .padding(.bottom)
                    Spacer()
                    ScrollView(.vertical) {
                        HStack {
                            Spacer()
                            LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: 0) {
                                ForEach(0..<gc.games.count, id: \.self) { i in
                                    GameButtonView(gc: gc, game: i, width: geo.size.width/4, height: geo.size.height/3.5)
                                }
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                        .frame(width: geo.size.width/1.03)
                    }
                    .edgesIgnoringSafeArea(.horizontal)
                }
                
                MainTopBarView(vc: vc, width: geo.size.width, height: geo.size.height)
            }
        }
    }
}
