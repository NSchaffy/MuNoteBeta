//
//  Main_TopBarView.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-08.
//

import SwiftUI

struct MainTopBarView: View {
    //for settings and main tutorial
    @StateObject var vc = ViewController.vc

    var homeButton: Bool?
    var width: CGFloat
    var height: CGFloat
    
    var showNotes = true
    var showBlue = true
    
    var shadowRadius: CGFloat = 2
    var cornerRadius: CGFloat {
        width/40
    }
    
    var body: some View {
        HStack(alignment: .top) {  
//Main + back + home buttons
            if vc.currentView == .home {
                Capsule()
                    .foregroundStyle(LinearGradient(colors: [Color.mSubtitle, Color.mTitle], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .overlay {
                        HStack(spacing: width/50) {
                            Text("MuNote")
                                .foregroundColor(.mText)
                                .font(MFont().getFont(type: .fTitle, height: height))
                            Image("ingamelogo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height/4.2)
                        }
                    }
                    .frame(width: width/1.5, height: height/2.8)
                    .padding(.horizontal)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.shadow(.inner(radius: shadowRadius)))
                    .foregroundColor(.mDgrey)
                    .overlay {
                        Button(CurrentView.home.rawValue) {
                            vc.currentView = .home
                        }
                        .font(MFont().getFont(type: .fSSub, height: height))
                        .foregroundColor(.mText)
                    }
                    .frame(width: width/8, height: height/8)
                Spacer()
            }
            
//Titles
            if vc.currentView != .home {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.mTitle)
                    .overlay {
                        Text(vc.currentView.rawValue)
                            .foregroundColor(.mText)
                            .font(MFont().getFont(type: .fSub, height: height))
                    }
                    .frame(width: width/3.5, height: height/7)
            }
            Spacer()
            
//Blue Button
            if vc.currentView != .home {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.shadow(.inner(radius: shadowRadius)))
                    .foregroundColor(.mSubtitle)
                    .overlay {
                        if vc.currentView == .gamesMenu {
                            Button(CurrentView.studioMenu.rawValue) {
                                    vc.currentView = .studioMenu
                                }
                            .foregroundColor(.mText)
                        } else if vc.currentView == .studioMenu {
                            Button(CurrentView.gamesMenu.rawValue) {
                                vc.currentView = .gamesMenu
                            }
                            .foregroundColor(.mText)
                        }
                    }
                    .font(MFont().getFont(type: .fSSub, height: height))
                    .frame(width: width/8, height: height/8)
                    .opacity(showBlue ? 1 : 0)
            }
            
//Notes
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.mGold)
                .overlay {
                    Text(String(UserData.shared.notesCurrency))
                        .foregroundColor(.mText)
                    + Text(Image(systemName: "music.note"))
                        .foregroundColor(.mText)
                }
                .font(MFont().getFont(type: .fSSub, height: height*1.1))
                .frame(width: width/8, height: height/8)
                .padding(.horizontal)
                .opacity(showNotes ? 1 : 0)
        }
        .padding()
        .padding(.vertical)
    }
}

