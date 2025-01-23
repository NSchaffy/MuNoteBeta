//
//  GuessButtons.swift
//  MuNoteBeta
//
//  Created by Account on 2023-02-17.
//

import SwiftUI

//implement a protocol
protocol GuessButton {
    var hasBeenGuessed: Bool { get set }
    var isCorrect: Bool { get set }
    var isSelected: Bool { get set }
}

struct GuessButtonLayout: View {
    var button: GuessButton
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if button.isCorrect {
                shape.fill(.shadow(.inner(radius: 5))).foregroundColor(.green)
            } else if button.hasBeenGuessed {
                shape.fill(.shadow(.inner(radius: 5))).foregroundColor(.red)
            } else if button.isSelected {
                shape.fill(.shadow(.inner(radius: 5))).foregroundColor(Color.mGrey)
            } else {
                RoundedRectangle(cornerRadius: 20).foregroundColor(.mDgrey).offset(y: 1.75)
                shape.fill().foregroundColor(Color.mGrey)
            }
        }
    }
}

struct NoteGuessButton: Identifiable, GuessButton {
    var id: Int
    var name: String
    var hasBeenGuessed = false
    var isCorrect = false
    var isSelected = false
}

struct NoteButton: View {
    var button: NoteGuessButton
    var font: Font
    
    var body: some View {
        ZStack {
            GuessButtonLayout(button: button)
            
            Text(button.name).font(font).foregroundColor(Color.mBlack)
        }
    }
}

struct AccidentalGuessButton: Identifiable, GuessButton {
    var id: Int
    var accidental: Accidental
    var hasBeenGuessed = false
    var isCorrect = false
    var isSelected = false
}

struct AccidentalButton: View {
    var button: AccidentalGuessButton
    var font: Font
    
    var body: some View {
        ZStack {
            GuessButtonLayout(button: button)
            
            if button.accidental == Accidental.natural {
                Text("♮").font(font).foregroundColor(Color.mBlack)
            } else {
                Text(button.accidental.string.short).font(font).foregroundColor(Color.mBlack)
            }
        }
    }
}

struct QualityGuessButton: Identifiable, GuessButton {
    var id: Int
    var quality: String
    var hasBeenGuessed = false
    var isCorrect = false
    var isSelected = false
}

struct QualityButton: View {
    var button: QualityGuessButton
    var font: Font
    
    var body: some View {
        ZStack {
            GuessButtonLayout(button: button)
            
            Text(button.quality).font(font).foregroundColor(Color.mBlack)
        }
    }
}

struct DistanceGuessButton: Identifiable, GuessButton {
    var id: Int
    var distance: String
    var hasBeenGuessed = false
    var isCorrect = false
    var isSelected = false
}

struct DistanceButton: View {
    var button: DistanceGuessButton
    var font: Font
    
    var body: some View {
        ZStack {
            GuessButtonLayout(button: button)
            
            Text(button.distance).font(font).foregroundColor(Color.mBlack)
        }
    }
}

struct StepGuessButton: Identifiable, GuessButton {
    var id: Int
    var step: String
    var hasBeenGuessed = false
    var isCorrect = false
    var isSelected = false
}

struct StepButton: View {
    var button: StepGuessButton
    var font: Font
    
    var body: some View {
        ZStack {
            GuessButtonLayout(button: button)
            
            Text(button.step).font(font).foregroundColor(Color.mBlack)
        }
    }
}
