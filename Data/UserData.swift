//
//  Notes.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-11.
//

import Foundation

class UserData: ObservableObject {
    static let shared = UserData()
    
//Notes
    @Published var notesCurrency: Int = 0
    
    func increaseNotes(by amount: Int) {
        notesCurrency += amount
    }
    func decreaseNotes(by amount: Int) {
        notesCurrency -= amount
    }
    
//Status
    @Published var status: Int = 0
    @Published var statusLevel: Int = 0
    
    var statusBase: Int {
        return ((statusLevel * statusLevel) + (50 * statusLevel) + 50)
    }
    
    func increaseStatus(by amount: Int) {
        status += amount
        
        if status >= statusBase {
            statusLevel += 1
        }
    }
    
//Studios
    
//Read & Write
    func saveData() {
        
    }
}


struct NoteCurrency {
    var notesCurrency: Int = 0
    var totalNotes: Int = 0
    
    mutating func increaseNotes(by amount: Int) {
        notesCurrency += amount
    }
    mutating func decreaseNotes(by amount: Int) {
        notesCurrency -= amount
    }
}

struct StatusLevel {
    var status: Int = 0
    var statusLevel: Int = 0
    
    var statusBase: Int {
        return ((statusLevel * statusLevel) + (50 * statusLevel) + 50)
    }
    
    mutating func increaseStatus(by amount: Int) {
        status += amount
        
        if status >= statusBase {
            statusLevel += 1
        }
    }

}
