//
//  Main.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-07.
//

import SwiftUI

struct Home: View {
    @StateObject var vc = ViewController.vc
    
    var body: some View {
        ZStack {
            Color.mBackground.ignoresSafeArea()
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height
                VStack {
                    TopBarFiller(width: width, height: height*2)
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        
                        HomeSelectionButton(width: width/3.5, height: height, text: CurrentView.gamesMenu.rawValue, function: { vc.currentView = .gamesMenu })
                        
                        Spacer()
                        
                        HomeSelectionButton(width: width/3.5, height: height, text: CurrentView.studioMenu.rawValue, function: { vc.currentView = .studioMenu })
                        
                        Spacer()
                    }
                    Spacer()
                }
                
                MainTopBarView(width: width, height: height)
            }
        }
    }
}

struct HomeSelectionButton: View {
    var width: CGFloat
    var height: CGFloat
    var text: String
    var function: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(.shadow(.inner(radius: 2)))
            .frame(width: width, height: height/3.5)
            .foregroundColor(.mSubtitle)
            .overlay {
                Button(text) {
                    function()
                }
                .foregroundColor(.mText)
                .font(MFont().getFont(type: .fTitle, height: height*0.7))
            }.padding(.horizontal)
    }
}
