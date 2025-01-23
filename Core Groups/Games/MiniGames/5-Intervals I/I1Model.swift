//
//  I1Model.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-05.
//

import Foundation

/*
 
 getinterval()
 
 root = beginner.randomeelement()
 interval = beginner.randomelement()
 
 if interval.SP < root.SP { interval.upOctave() }
 answer = String(interval.staffdistance + 1)
 
 easyKeys = []
 
 
 */

/*
 two optional String variables: qualityGuess, distanceGuess
 have two functions, one to guess quality, the other distance.
 in the functions the respective variable will be set to the guess
 the button tapped will be selected, all others will be set to !selected
 
 at the end of the function, each will call the function checkAnswer(), which will take the two answer strings from the buttons.
 
 
 checkAnswer() doesn't accept optionals, so before each call, the guess functions will check if the other variable has a value.
 
 newInterval() {
 switch mode {
 case beginner:
    ns = beginner.random element ?? c
    interval = ns.begginnerIntervals.randomelemment
 */

struct I1Model {
    let game = 5
    
    private var amount: Int {
        return GameViewController.gc.games[game].currentMode.number + GameViewController.gc.games[game].difficulty
    }
    
    static var mezzo: [NoteStruct] = [NS.c, NS.g, NS.f]
    static var maestro: [NoteStruct] = NS.commonNS
    
    private(set) var interval: Interval = NS.c.maj2
    private(set) var ns: NoteStruct = NS.c
    private(set) var clef: Clef = Clefs.treble
    
    var qualityIndex: Int? = nil
    var distanceIndex: Int? = nil
    //correct x found
    var CoQuFo = false
    var CoDiFo = false
    
    mutating func checkAnswer(qButton: QualityGuessButton?, dButton: DistanceGuessButton?) -> Bool {
        if qButton != nil {
            for i in 0..<qButtons.count {
                qButtons[i].isSelected = false
            }
            if let chosenQIndex = qButtons.firstIndex(where: { $0.id == qButton?.id }), !qButtons[chosenQIndex].isCorrect, !qButtons[chosenQIndex].hasBeenGuessed, !CoQuFo {
                qualityIndex = chosenQIndex
                qButtons[chosenQIndex].isSelected = true
            }
        }
        
        if dButton != nil {
            for i in 0..<dButtons.count {
                dButtons[i].isSelected = false
            }
            if let chosenDIndex = dButtons.firstIndex(where: { $0.id == dButton?.id }), !dButtons[chosenDIndex].isCorrect, !dButtons[chosenDIndex].hasBeenGuessed, !CoDiFo {
                distanceIndex = chosenDIndex
                dButtons[chosenDIndex].isSelected = true
            }
        }
        
        if let quality = qualityIndex, let distance = distanceIndex {
            if qButtons[quality].quality + dButtons[distance].distance == interval.answer {
                qButtons[quality].isCorrect = true
                dButtons[distance].isCorrect = true
                UserData.shared.increaseNotes(by: amount)
                UserData.shared.increaseStatus(by: amount)
                return true
            }  else if interval.answer.contains(qButtons[quality].quality) {
                qButtons[quality].isCorrect = true
                dButtons[distance].isSelected = false
                dButtons[distance].hasBeenGuessed = true
                CoQuFo = true
            } else if interval.answer.contains(dButtons[distance].distance) {
                dButtons[distance].isCorrect = true
                qButtons[quality].isSelected = false
                qButtons[quality].hasBeenGuessed = true
                CoDiFo = true
            } else {
                qButtons[quality].isSelected = false
                qButtons[quality].hasBeenGuessed = true
                dButtons[distance].isSelected = false
                dButtons[distance].hasBeenGuessed = true
            }
        } else if GameViewController.gc.games[game].currentMode == GameModes.beginner, let distance = distanceIndex {
            if dButtons[distance].distance == String(interval.answer.last!) {
                dButtons[distance].isCorrect = true
                UserData.shared.increaseNotes(by: amount)
                UserData.shared.increaseStatus(by: amount)
                return true
            } else {
                dButtons[distance].isSelected = false
                dButtons[distance].hasBeenGuessed = true
            }
        }
        return false
    }
    
    mutating func newInterval() {
        let tempInterval = interval
        
        while(interval == tempInterval) {
            switch GameViewController.gc.games[game].currentMode {
            case GameModes.mezzo:
                ns = I1Model.mezzo.randomElement() ?? NS.c
                interval = ns.mezzoIntervals.randomElement() ?? ns.maj2
            case GameModes.maestro:
                ns = I1Model.maestro.randomElement() ?? NS.c
                interval = ns.allIntervals.randomElement() ?? ns.maj2
            default: //beginner
                ns = I1Model.mezzo.randomElement() ?? NS.c
                interval = ns.beginnerIntervals.randomElement() ?? ns.maj2
            }
        }
        
        for num in 0...6 {
            dButtons[num].hasBeenGuessed = false
            dButtons[num].isCorrect = false
            dButtons[num].isSelected = false
        }
        for num in 0...4 {
            qButtons[num].hasBeenGuessed = false
            qButtons[num].isCorrect = false
            qButtons[num].isSelected = false
        }
        qualityIndex = nil
        distanceIndex = nil
        CoQuFo = false
        CoDiFo = false
    }
    
    var qButtons: [QualityGuessButton] = [QualityGuessButton(id: 0, quality: "dim"), QualityGuessButton(id: 1, quality: "min"), QualityGuessButton(id: 2, quality: "perf"), QualityGuessButton(id: 3, quality: "maj"), QualityGuessButton(id: 4, quality: "aug")]
    
    var dButtons: [DistanceGuessButton] = [DistanceGuessButton(id: 0, distance: "2"), DistanceGuessButton(id: 1, distance: "3"), DistanceGuessButton(id: 2, distance: "4"), DistanceGuessButton(id: 3, distance: "5"), DistanceGuessButton(id: 4, distance: "6"), DistanceGuessButton(id: 5, distance: "7"), DistanceGuessButton(id: 6, distance: "8")]
    
    init() {
        newInterval()
    }
}
