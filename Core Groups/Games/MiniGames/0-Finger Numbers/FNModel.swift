//
//  FNModel.swift
//  MuNoteBeta
//
//  Created by Nicholaus on 2023-08-28.
//

import SwiftUI

struct FNModel {
    let game = 0
    
    private var amount: Int {
        return GameViewController.gc.games[game].currentMode.number + GameViewController.gc.games[game].difficulty
    }
    
    static var fingerNum = "1"
    
    func newImage() {
        
    }
    
    init() {
        newImage()
    }
    
    var piano: [fingerNumber] = [fingerNumber("1", "LH1"), fingerNumber("2", "LH2"), fingerNumber("3", "LH3"), fingerNumber("4", "LH4"), fingerNumber("5", "LH5"), fingerNumber("1", "RH1"), fingerNumber("2", "RH2"), fingerNumber("3", "RH3"), fingerNumber("4", "RH4"), fingerNumber("5", "RH5")]
    
    var violin: [fingerNumber] = [fingerNumber("T", "LH1"), fingerNumber("1", "LH2"), fingerNumber("2", "LH3"), fingerNumber("3", "LH4"), fingerNumber("4", "LH5")]
    
    var guitar: [fingerNumber] = [fingerNumber("T", "LH1"), fingerNumber("1", "LH2"), fingerNumber("2", "LH3"), fingerNumber("3", "LH4"), fingerNumber("4", "LH5"), fingerNumber("p", "RH1"), fingerNumber("i", "RH2"), fingerNumber("m", "RH3"), fingerNumber("a", "RH4"), fingerNumber("c", "RH5")]
}

struct fingerNumber {
    var answer: String
    var imageString: String
    
    var image: UIImage
    
    init(_ answer: String, _ imageString: String) {
        self.answer = answer
        self.imageString = imageString
        self.image = UIImage(named: imageString) ?? UIImage()
    }
}
