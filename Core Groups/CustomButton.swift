//
//  CustomButton.swift
//  MuNoteBeta
//
//  Created by Nicholaus on 2023-07-19.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var font: Font
    
    var fillColour: Color
    var foregroundColor: Color
    
    var width: CGFloat
    var height: CGFloat
    var radius: CGFloat
    
    var function: () -> Void
    
    @State var offset: CGFloat = 1.75
    @State var innerShadow: CGFloat = 0
    @State var opacity: CGFloat = 1
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius).foregroundColor(.mBlack).offset(y: offset)
            
            RoundedRectangle(cornerRadius: radius)
                .fill(.shadow(.inner(radius: innerShadow)))
                .foregroundColor(fillColour)
            
            Text(text)
                .foregroundColor(foregroundColor)
                .font(font)
                .opacity(opacity)
        }
        .frame(width: width, height: height)
        .buttonStyle(CustomButtonStyle(onPressed: {
            offset = 0
            innerShadow = 5
            opacity = 0.8
        }, onReleased: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.function()
            }
        }))
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    var onPressed: () -> Void
    
    var onReleased: () -> Void
    
    // Wrapper for isPressed where we can run custom logic via didSet (or willSet)
    @State private var isPressedWrapper: Bool = false {
        didSet {
            // new value is pressed, old value is not pressed -> switching to pressed state
            if (isPressedWrapper && !oldValue) {
                onPressed()
            }
            // new value is not pressed, old value is pressed -> switching to unpressed state
            else if (oldValue && !isPressedWrapper) {
                onReleased()
            }
        }
    }
    
    // return the label unaltered, but add a hook to watch changes in configuration.isPressed
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .onChange(of: configuration.isPressed, perform: { newValue in isPressedWrapper = newValue })
    }
}
