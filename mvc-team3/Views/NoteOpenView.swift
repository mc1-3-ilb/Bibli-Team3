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
                    List{
                        
                            Text(note.noteTitle)
                                .bold()
                                .padding(.horizontal)
                                .frame( alignment: .leading)
                                .border(.background)
                        
                            Text(note.noteText)
                                .padding()
                                .frame( alignment: .leading)
                        
                       
                        
                    }
                    Spacer()
                }.navigationBarItems(
                    trailing:
                        Button("Edit") {
                            print("Edited")
                        }
                )
                
            }
        }
    }
    
}
