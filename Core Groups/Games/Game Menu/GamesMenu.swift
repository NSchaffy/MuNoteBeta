//
//  GamesMenu.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-07.
//

import SwiftUI

struct GamesMenu: View {
    @StateObject var vc = ViewController.vc
    @StateObject var gc = GameViewController.gc

    var body: some View {
        ZStack {
            switch gc.currentGame {
            case 0:
                FNView()
            case 1:
                STView()
            case 2:
                NN1View()
            case 3:
                SteView()
            case 4:
                KSView()
            case 5:
                I1View()
            default:
                GamesPage()
            }
        }
    }
}
