//
//  Extension_Array<Note>.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-16.
//

import Foundation

extension Array<Note> {
    func startingWith(_ note: Note) -> [Note]? {
        if self.contains(note) {
            var scale = self
            scale.remove(at: 0)
            while scale[0] != note {
                scale.append(scale[0])
                scale.remove(at: 0)
            }
            scale.append(scale[0])
            
            return scale
        }
        return nil
    }
    
    mutating func lowerBy2Octaves() {
        let n = self.count
        for i in 0..<n {
            self[i].octaveDown()
            self[i].octaveDown()
        }
    }
}
