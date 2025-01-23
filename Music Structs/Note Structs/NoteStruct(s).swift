//
//  A.swift
//  navigationMuNoteTest
//
//  Created by Nicholaus on 2022-12-16.
//

import Foundation

struct NoteStruct {
    let root: Note
    let majKey: KeySignature
    let minKey: KeySignature
    let majorScale: [Note] 
}

//A3-G4
struct NS {
//A
    static let ab = NoteStruct(
        root: N.ab3,
        majKey: KeySignature(.flat, 4, "AFlatMaj"),
        minKey: KeySignature(.flat, 7, "AFlatMin"),
        majorScale: [N.ab3, N.bb3, N.c4, N.db4, N.eb4, N.f4, N.g4, N.ab4]
    )
    static let a = NoteStruct(
        root: N.a3,
        majKey: KeySignature(.sharp, 3, "ANaturalMaj"),
        minKey: KeySignature(.natural, 0, "ANaturalMin"),
        majorScale: [N.a3, N.b3, N.cs4, N.d4, N.e4, N.fs4, N.gs4, N.a4]
    )
    static let aS = NoteStruct(
        root: N.aS3,
        majKey: KeySignature(.sharp, 10, "ASharpMaj"),
        minKey: KeySignature(.sharp, 7, "ASharpMin"),
        majorScale: [N.aS3, N.bs3, N.cx4, N.ds4, N.es4, N.fx4, N.gx4, N.aS4]
    )
//B
    static let bb = NoteStruct(
        root: N.bb3,
        majKey: KeySignature(.flat, 2, "BFlatMaj"),
        minKey: KeySignature(.flat, 5, "BFlatMin"),
        majorScale: [N.bb3, N.c4, N.d4, N.eb4, N.f4, N.g4, N.a4, N.bb4]
    )
    static let b = NoteStruct(
        root: N.b3,
        majKey: KeySignature(.sharp, 5, "BNaturalMaj"),
        minKey: KeySignature(.sharp, 2, "BNaturalMin"),
        majorScale: [N.b3, N.cs4, N.ds4, N.e4, N.fs4, N.gs4, N.aS4, N.b4]
    )
    static let bs = NoteStruct(
        root: N.bs3,
        majKey: KeySignature(.sharp, 12, "BSharpMaj"),
        minKey: KeySignature(.sharp, 9, "BSharpMin"),
        majorScale: [N.bs3, N.cx4, N.dx4, N.es4, N.fx4, N.gx4, N.ax4, N.bs4]
    )
//C
    static let cb = NoteStruct(
        root: N.cb4,
        majKey: KeySignature(.flat, 7, "CFlatMaj"),
        minKey: KeySignature(.flat, 10, "CFlatMin"),
        majorScale: [N.cb4, N.db4, N.eb4, N.fb4, N.gb4, N.ab4, N.bb4, N.cb5]
    )
    static let c = NoteStruct(
        root: N.c4,
        majKey: KeySignature(.natural, 0, "CNaturalMaj"),
        minKey: KeySignature(.flat, 3, "CNaturalMin"),
        majorScale: [N.c4, N.d4, N.e4, N.f4, N.g4, N.a4, N.b4, N.c5]
    )
    static let cs = NoteStruct(
        root: N.cs4,
        majKey: KeySignature(.sharp, 7, "CSharpMaj"),
        minKey: KeySignature(.sharp, 4, "CSharpMin"),
        majorScale: [N.cs4, N.ds4, N.es4, N.fs4, N.gs4, N.aS4, N.bs4, N.cs5]
    )
//D
    static let db = NoteStruct(
        root: N.db4,
        majKey: KeySignature(.flat, 5, "DFlatMaj"),
        minKey: KeySignature(.flat, 8, "DFlatMin"),
        majorScale: [N.db4, N.eb4, N.f4, N.gb4, N.ab4, N.bb4, N.c5, N.db5]
    )
    static let d = NoteStruct(
        root: N.d4,
        majKey: KeySignature(.sharp, 2, "DNaturalMaj"),
        minKey: KeySignature(.flat, 1, "DNaturalMin"),
        majorScale: [N.d4, N.e4, N.fs4, N.g4, N.a4, N.b4, N.cs5, N.d5]
    )
    static let ds = NoteStruct(
        root: N.ds4,
        majKey: KeySignature(.sharp, 9, "DSharpMaj"),
        minKey: KeySignature(.sharp, 6, "DSharpMin"),
        majorScale: [N.ds4, N.es4, N.fx4, N.gs4, N.aS4, N.bs4, N.cx5, N.ds5]
    )
//E
    static let eb = NoteStruct(
        root: N.eb4,
        majKey: KeySignature(.flat, 3, "EFlatMaj"),
        minKey: KeySignature(.flat, 6, "EFlatMin"),
        majorScale: [N.eb4, N.f4, N.g4, N.ab4, N.bb4, N.c5, N.d5, N.eb5]
    )
    static let e = NoteStruct(
        root: N.e4,
        majKey: KeySignature(.sharp, 4, "ENaturalMaj"),
        minKey: KeySignature(.sharp, 1, "ENaturalMin"),
        majorScale: [N.e4, N.fs4, N.gs4, N.a4, N.b4, N.cs5, N.ds5, N.e5]
    )
    static let es = NoteStruct(
        root: N.es4,
        majKey: KeySignature(.sharp, 11, "ESharpMaj"),
        minKey: KeySignature(.sharp, 8, "ESharpMin"),
        majorScale: [N.es4, N.fx4, N.gx4, N.aS4, N.bs4, N.cx5, N.dx5, N.es5]
    )
//F
    static let fb = NoteStruct(
        root: N.fb4,
        majKey: KeySignature(.flat, 8, "FFlatMaj"),
        minKey: KeySignature(.flat, 11, "FMin"),
        majorScale: [N.fb4, N.gb4, N.ab4, N.bbb4, N.cb5, N.db5, N.eb5, N.fb5]
    )
    static let f = NoteStruct(
        root: N.f4,
        majKey: KeySignature(.flat, 1, "FNaturalMaj"),
        minKey: KeySignature(.flat, 4, "FNaturalMin"),
        majorScale: [N.f4, N.g4, N.a4, N.bb4, N.c5, N.d5, N.e5, N.f5]
    )
    static let fs = NoteStruct(
        root: N.fs4,
        majKey: KeySignature(.sharp, 6, "FSharpMaj"),
        minKey: KeySignature(.sharp, 3, "FSharpMin"),
        majorScale: [N.fs4, N.gs4, N.aS4, N.b4, N.cs5, N.ds5, N.es5, N.fs5]
    )
//G
    static let gb = NoteStruct(
        root: N.gb4,
        majKey: KeySignature(.flat, 6, "GFlatMaj"),
        minKey: KeySignature(.flat, 9, "GFlatMin"),
        majorScale: [N.gb4, N.ab4, N.bb4, N.cb5, N.db5, N.eb5, N.f5, N.gb5]
    )
    static let g = NoteStruct(
        root: N.g4,
        majKey: KeySignature(.sharp, 1, "GNaturalMaj"),
        minKey: KeySignature(.flat, 2, "GNaturalMin"),
        majorScale: [N.g4, N.a4, N.b4, N.c5, N.d5, N.e5, N.fs5, N.g5]
    )
    static let gs = NoteStruct(
        root: N.gs4,
        majKey: KeySignature(.sharp, 8, "GSharpMaj"),
        minKey: KeySignature(.sharp, 5, "GSharpMin"),
        majorScale: [N.gs4, N.aS4, N.bs4, N.cs5, N.ds5, N.es5, N.fx5, N.gs5]
    )
    
    static let allNS: [NoteStruct] = [a, ab, aS, b, bb, bs, c, cb, cs, d, db, ds, e, eb, es, f, fb, fs, g, gb, gs]
    static let commonNS: [NoteStruct] = [f, c, g, d, a, e, b, fs, cs, db, ab, eb, bb]
}
