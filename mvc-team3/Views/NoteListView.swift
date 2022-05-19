
import SwiftUI

struct NoteListView: View {
    
    @State private var isPresented: Bool = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var noteListVM : NoteListViewModel
    
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
                    VStack{
                List {
                    ForEach(noteListVM.notes) { note in
                        NavigationLink(destination: NoteOpenView()) {
                            Text(note.noteText)
                        }
                        //                    Text (note.noteText)
                    }.onDelete(perform: deleteNote)
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                //dismiss
            }, content: {
                NoteTakeView(vm: TakeNoteViewModel(context: viewContext))
            })
            
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarItems(trailing: Button(action: {
//                print("back")
//                isPresented = true
//            }) {
//                Label("Add", systemImage: "plus")
//            }
               
//    )
    }
        
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext
        NoteListView(vm: NoteListViewModel(context: viewContext))
        
    }
}
