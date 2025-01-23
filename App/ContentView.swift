//
//  ContentView.swift
//  navigationGameTest
//
//  Created by Nicholaus on 2022-12-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vc = ViewController.vc
    
    var body: some View {
        ZStack {
            switch vc.currentView {
            case .gamesMenu:
                GamesMenu()
            case .studioMenu:
                StudioMenu()
            default:
                Home()
            }
        }
    }
}
