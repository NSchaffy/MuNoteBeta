//
//  IntervalExtension.swift
//  navigationMuNoteTest
//
//  Created by Account on 2023-02-02.
//

import Foundation

extension NoteStruct {
    
    var perf1: Interval {
        let interval = majorScale[0]
        return Interval(root, interval, "perf1")
    }
    var aug1: Interval {
        var interval = majorScale[0]
        interval.raise()
        return Interval(root, interval, "aug1")
    }
    
    var dim2: Interval {
        var interval = majorScale[1]
        interval.lowerby2()
        return Interval(root, interval, "dim2")
    }
    var min2: Interval {
        var interval = majorScale[1]
        interval.lower()
        return Interval(root, interval, "min2")
    }
    var maj2: Interval {
        let interval = majorScale[1]
        return Interval(root, interval, "maj2")
    }
    var aug2: Interval {
        let scale = majorScale
        var interval = scale[1]
        interval.raise()
        return Interval(root, interval, "aug2")
    }
    
    var dim3: Interval {
        var interval = majorScale[2]
        interval.lowerby2()
        return Interval(root, interval, "dim3")
    }
    var min3: Interval {
        var interval = majorScale[2]
        interval.lower()
        return Interval(root, interval, "min3")
    }
    var maj3: Interval {
        let interval = majorScale[2]
        return Interval(root, interval, "maj3")
    }
    var aug3: Interval {
        var interval = majorScale[2]
        interval.raise()
        return Interval(root, interval, "aug3")
    }
    
    var dim4: Interval {
        var interval = majorScale[3]
        interval.lower()
        return Interval(root, interval, "dim4")
    }
    var perf4: Interval {
        let interval = majorScale[3]
        return Interval(root, interval, "perf4")
    }
    var aug4: Interval {
        var interval = majorScale[3]
        interval.raise()
        return Interval(root, interval, "aug4")
    }
    
    var dim5: Interval {
        var interval = majorScale[4]
        interval.lower()
        return Interval(root, interval, "dim5")
    }
    var perf5: Interval {
        let interval = majorScale[4]
        return Interval(root, interval, "perf5")
    }
    var aug5: Interval {
        var interval = majorScale[4]
        interval.raise()
        return Interval(root, interval, "aug5")
    }
    
    var dim6: Interval {
        var interval = majorScale[5]
        interval.lowerby2()
        return Interval(root, interval, "dim6")
    }
    var min6: Interval {
        var interval = majorScale[5]
        interval.lower()
        return Interval(root, interval, "min6")
    }
    var maj6: Interval {
        let interval = majorScale[5]
        return Interval(root, interval, "maj6")
    }
    var aug6: Interval {
        var interval = majorScale[5]
        interval.raise()
        return Interval(root, interval, "aug6")
    }
    
    var dim7: Interval {
        var interval = majorScale[6]
        interval.lowerby2()
        return Interval(root, interval, "dim7")
    }
    var min7: Interval {
        var interval = majorScale[6]
        interval.lower()
        return Interval(root, interval, "min7")
    }
    var maj7: Interval {
        let interval = majorScale[6]
        return Interval(root, interval, "maj7")
    }
    var aug7: Interval {
        var interval = majorScale[6]
        interval.raise()
        return Interval(root, interval, "aug7")
    }
    
    var dim8: Interval {
        var interval = majorScale[7]
        interval.lower()
        return Interval(root, interval, "dim8")
    }
    var perf8: Interval {
        let interval = majorScale[7]
        return Interval(root, interval, "perf8")
    }
    var aug8: Interval {
        var interval = majorScale[7]
        interval.raise()
        return Interval(root, interval, "aug8")
    }
    
    var allIntervals: [Interval] {
        return [dim2, min2, maj2, aug2, dim3, min3, maj3, aug3, dim4, perf4, aug4, dim5, perf5, aug5, dim6, min6, maj6, aug6, dim7, min7, maj7, aug7, dim8, perf8, aug8,]
    }
    
    var mezzoIntervals: [Interval] {
        return [min2, maj2, min3, maj3, perf4, perf5, min6, maj6, min7, maj7, perf8]
    }
    
    var beginnerIntervals: [Interval] {
        return [maj2, maj3, perf4, perf5, maj6, maj7, perf8]
    }
}
