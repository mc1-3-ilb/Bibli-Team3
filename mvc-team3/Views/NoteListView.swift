
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
        
        NavigationView{
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
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button{
                        isPresented = true
                    } label: {
                        Label("Add Note", systemImage: "plus.circle.fill")
                    }
                    Button{
                        print("Book")
                    } label: {
                        Image(systemName: "plus.square.fill.on.square.fill")
                        Text("Add Book")

                    }
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
