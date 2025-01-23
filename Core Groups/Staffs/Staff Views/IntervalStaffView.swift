//
//  IntervalStaffView.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-04.
//

import SwiftUI

struct IntervalStaffView: View {
    var width: CGFloat
    var height: CGFloat
    var clef: Clef
    var interval: Interval
    var key: KeySignature
    var ns: NoteStruct
    var withKey: Bool
    
    var body: some View {
        let root = interval.root.staffPosition
        let top = interval.interval.staffPosition
        
        ZStack {
            BaseStaffView(clef: clef, width: width, height: height)
            
            HStack(spacing:0) {
                ClefSpaceView(height: height)
                
                if withKey {
                    VStack(spacing: 0) {
                        let positions = key.getPositions(for: clef)
                        ForEach(clef.lowerBound...clef.upperBound, id: \.self) { i in
                            ZStack {
                                StaffLine(width: width)
                                if positions.contains(i) {
                                    Text(key.type.string.short)
                                        .foregroundColor(Color.mBlack)
                                        .font(.system(size: height/5))
                                        .frame(height: height/20)
                                        .offset(x: CGFloat(positions.firstIndex(of: i)!)*height/6-height/4)
                                }
                            }
                        }
                    }
                }

                Spacer()
                
                VStack(spacing: 0) {
                    ForEach(clef.lowerBound...clef.upperBound, id: \.self) { i in
                        ZStack {
                            if (root >= clef.upperBound - 2 || top >= clef.upperBound - 2) && i == clef.upperBound - 2 {
                                StaffLine(width: height/5).stroke(CSS().black)
                            } else if (root <= clef.lowerBound + 2 || top <= clef.lowerBound + 2) && i == clef.lowerBound + 2 {
                                StaffLine(width: height/5).stroke(CSS().black)
                            } else {
                                StaffLine(width: width)
                            }
                            
                            if root == i {
                                NoteView(height: height, note: interval.root, key: key)
                            }
                            if top == i {
                                NoteView(height: height, note: interval.interval, isSecond: (root - top == 1), key: key)
                            }
                        }
                    }
                }
                Spacer()
            }.frame(maxWidth: width, minHeight: height*1.5, maxHeight: height*1.5)
            
            HStack {
                ClefView(clef: clef.name, height: height)
                Spacer()
            }.frame(maxWidth: width)
        }
    }
}
