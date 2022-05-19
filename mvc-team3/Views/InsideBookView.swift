import SwiftUI

struct InsideBookView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    @State private var showingOptions = false
    @State private var navigationLinkNotes = false
    @State private var navigationLinkImage = false
    @State private var navigationLinkVoice = false
    //@EnvironmentObject  var vm: ImageViewModel
    
    
    //contoh dulu
    var data: Int = 1
    let items = Array(1...5).map({"\($0) Avatar : The Legend of Aang"})
    
    let layout = [
        GridItem(.adaptive(minimum:150))
    ]
    let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext
    
    //------
    
    var body: some View {
        VStack{
            if data == 0{
                Text("Tap + to add new note")
                    .foregroundColor(Color(UIColor.black))
                
                
            } else {
                HStack{

                    NoteListView(vm: NoteListViewModel(context: viewContext))
                        .environment(\.managedObjectContext, viewContext)
                    
//                    NavigationLink(destination: NoteListView(vm: NoteListViewModel(context: viewContext)), isActive: $navigationLinkNotes) {
//                        EmptyView()
//                        NoteListView(vm: NoteListViewModel(context: viewContext))
//                            .environment(\.managedObjectContext, viewContext)
//                    }
                    NavigationLink(destination: TakeImageView()
                        .environmentObject(ImageViewModel())
                        .onAppear {
                            UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                        },
                                   isActive: $navigationLinkImage) {
                        EmptyView()
                    }
                    
                    
                }
                .background(
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                )
                .navigationTitle("Avatar : The Legend of Aang")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
        
        .navigationBarItems(trailing: Button(action: {
            print("back")
            
// FUNGSI EDIT
            
        }) {
            Text("Edit")
        }
           
           
        )
        
        
    }
}



struct InsideBookView_Preview: PreviewProvider {
    static var previews: some View {
        InsideBookView().environmentObject(ImageViewModel())
    }
}
