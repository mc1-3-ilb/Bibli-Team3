//
//  NoteOpenView.swift
//  NoteCoreData
//
//  Created by Nadia Ramadhani on 18/05/22.
//

import SwiftUI
struct NoteOpenView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var noteListVM : NoteListViewModel
    
    
    init(vm: NoteListViewModel) {
        self.noteListVM = vm
    }
    var data: Int = 1
    var body: some View {
//        LazyHGrid(columns: layout, content: {
//            ForEach(vm.titleVar) { NoteEntity in
//                NavigationLink(destination: InsideBookView()){
                    VStack {
    
        if (data == 0) {
            Text("good")
        } else {
            let note = noteListVM.notes[0]
            VStack{
                
            Text(note.noteTitle)
                    .padding()
                
            Text(note.noteText)
                    .padding()
            }
        }
                    }
                }
//            }
//
//    }
//    )
//}

//
//struct NoteOpenView_Previews: PreviewProvider {
//        static var previews: some View {
//            NoteOpenView()
//
//
//        }
//    }
}
