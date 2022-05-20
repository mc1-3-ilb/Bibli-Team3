//
//  ContentView.swift
//  NoteCoreData
//
//  Created by Nadia Ramadhani on 18/05/22.
//

import SwiftUI

struct NoteListView: View {
    
    @State private var showingSheet = false
    @State private var isPresented: Bool = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var noteListVM : NoteListViewModel
    @State private var navigationLinkNotes = false
    @State private var navigationLinkImage = false
    @State private var navigationLinkVoice = false
    @State private var showSheet = false
    
    
    init(vm: NoteListViewModel) {
        self.noteListVM = vm
    }
    private func deleteNote (at offsets: IndexSet) {
        offsets.forEach { index in
            let note = noteListVM.notes[index]
            noteListVM.deleteNote(noteId: note.id)
            
        }
    }
    var body: some View {
        
        
        NavigationLink(destination: NoteTakeView(vm: TakeNoteViewModel(context: viewContext)), isActive: $navigationLinkNotes) {
            EmptyView()
        }
        NavigationLink(destination: TakeImageView()
            .environmentObject(ImageViewModel())
            .onAppear {
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            },
                       isActive: $navigationLinkImage) {
            EmptyView()
        }
        VStack{
            List {
                ForEach(noteListVM.notes) { note in
                    NavigationLink(destination: NoteOpenView(vm: noteListVM)) {
                        VStack{
                            Text(note.noteTitle)
                            Text(noteTime(date:note.noteDate))
                                .foregroundColor(.gray)
                                .italic()
                            
                            
                            //Text(note.noteText)
                            
                        }
                    }
                    //                    Text (note.noteText)
                    
                }.onDelete(perform: deleteNote)
                
            }
        }
        //        .sheet(isPresented: $isPresented, onDismiss: {
        //            //dismiss
        //        }, content: {
        //            NoteTakeView(vm: TakeNoteViewModel(context: viewContext))
        //
        //        })
        
        //    .navigationTitle("Notes")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    showSheet.toggle()
                    
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    Text("New item")
                })          .actionSheet(isPresented: $showSheet) {
                    ActionSheet(
                        title: Text("Choose notes type"),
                        buttons: [
                            .default(Text("New Folder"), action: {print ("tapped")
                            }),
                            .default(Text("Notes"), action: {
                                
                                withAnimation{
                                    navigationLinkNotes = true}
                            }),
                            
                                .default(Text("Photos"), action:
                                            {
                                                withAnimation{
                                                    
                                                    navigationLinkImage = true}
                                            }),
                            
                                .default(Text("Voice Notes"), action: {print ("tapped")
                                }),
                            
                                .default(Text("Import Media"), action: {print ("tapped")
                                }),
                            
                                .cancel()
                            
                        ]
                    )
                }
                
                
            }
        }
        
        
        
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext
        NoteListView(vm: NoteListViewModel(context: viewContext))
        
    }
}
