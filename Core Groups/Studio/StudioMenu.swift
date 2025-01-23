//
//  StudiosMenu.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-07.
//

import SwiftUI

struct StudioMenu: View {
    @StateObject var vc = ViewController.vc
    
    var body: some View {
        ZStack {
            Color.mBackground.ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    TopBarFiller(width: geo.size.width, height: geo.size.height)
                    Spacer()
                    HStack {
                        Button("+") {
                            
                        }
                        
                        // Foreach (record in records: RecordButtonView(record: record) - on tap gesture (RecordView(record: record)))
                    }
                    Spacer()
                    Button("Musicians") {
                        
                    }
                    Spacer()
                }
                MainTopBarView(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

