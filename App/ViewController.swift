//
//  ViewController.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-07.
//

import Foundation

class ViewController: ObservableObject {
    static let vc = ViewController()
    
    @Published var currentView: CurrentView = .home
}

enum CurrentView: String {
    case home = "Home"
    case gamesMenu = "Games"
    case studioMenu = "Studio"
}
