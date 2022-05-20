//
//  NoteOpenView.swift
//  NoteCoreData
//
//  Created by Nadia Ramadhani on 18/05/22.
//

import SwiftUI
struct NoteOpenView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var noteVM : NoteViewModel
    
    init(vm: NoteViewModel) {
        self.noteVM = vm
    }
    var data: Int = 1
    var body: some View {
                    VStack {
    
        if (data == 0) {
            Text("good")
        } else {
            let note = noteVM
            VStack{
            Section{
            Text(note.noteTitle)
                    .padding()
                
                
            Text(note.noteText)
                    .padding()
                
            }
            }
        }
                    }
                }

}
