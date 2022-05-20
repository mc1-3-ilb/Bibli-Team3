import SwiftUI

struct MainScreenView: View {
    @State private var showingSheet:Bool = false
    @State private var searchText: String = ""
    @StateObject var vm = BookFolderViewModel()
    @State private var navigationLinkNotes: Bool = false
    @State private var navigationLinkImage: Bool = false
    @State private var navigationLinkImportMedia: Bool = false
    @State private var navigationLinkVoice: Bool = false
    @State private var showSheet: Bool = false
    //contoh dulu
    var data: Int = 1
    //------
    let layout = [
        GridItem(.adaptive(minimum:100))
    ]
    let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext

    var body: some View {

        NoteActionSheetView(navigationLinkNotes: $navigationLinkNotes, navigationLinkImage: $navigationLinkImage, navigationLinkImportMedia: $navigationLinkImportMedia, navigationLinkVoice: $navigationLinkVoice)

        VStack{
            if(data==0){
                Text("Tap + to add new book")
            }
            else {
                ScrollView(.vertical){
                    LazyVGrid(columns: layout, content: {
                        ForEach(vm.savedEntities) { entity in
                            NavigationLink(destination: InsideBookView()){
                                VStack {
                                    Image("book")
                                        .resizable()
                                        .frame(width: 67, height: 81)
                                    Text(entity.titleBook ?? "-").bold().foregroundColor(.black)
                                        .font(.caption)
                                        .padding(.horizontal)
                                    Text(entity.authorBook ??
                                        "-").foregroundColor(.secondary).font(.caption2)
                                        .padding(.bottom)
                                }
                            }
                        }
                    })
                }.padding(.vertical,15)
            }
        }
        .searchable(text: $searchText, prompt: "Looking for book folder?")
        .navigationTitle("Book Shelves")
        .foregroundColor(Color("AccentColor"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            trailing:
                Button("Edit") {
                    print("Edit")
                }
            )
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    showSheet.toggle()
                    
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    Text("New item")
                })
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(
                        title: Text("Choose notes type"),
                        buttons: [
//                            .default(Text("New Folder"), action:{
//                            }),
                            .default(Text("Text Note"), action: {
                                withAnimation{
                                    navigationLinkNotes = true}
                            }),
                            .default(Text("Take a Photo"), action: {
                                withAnimation{
                                    navigationLinkImage = true}
                            }),
                            .default(Text("Import Media"), action: {
                                withAnimation{
                                    navigationLinkImportMedia = true}
                            }),
                            .default(Text("Voice Notes"), action: { withAnimation{
                                navigationLinkVoice = true}
                            }),
                            .cancel()
                        ]
                    )
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    showingSheet.toggle()
                    
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    Text("Add book")
                    
                }).sheet(isPresented: $showingSheet){
                    AddBookView()
                }
            }

        }
        
    }
}

struct NoteActionSheetView: View {
    @Binding var navigationLinkNotes: Bool
    @Binding var navigationLinkImage: Bool
    @Binding var navigationLinkImportMedia: Bool
    @Binding var navigationLinkVoice: Bool
    let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext
    
    var body: some View {
        HStack {
            NavigationLink(destination: NoteTakeView(vm: TakeNoteViewModel(context: viewContext)), isActive: $navigationLinkNotes) {
                EmptyView()
            }
            NavigationLink(destination: TakeImageView()
                .environmentObject(ImageViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }, isActive: $navigationLinkImage) {
                EmptyView()
            }
            NavigationLink(destination: ImportMediaView()
                .environmentObject(ImageViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }, isActive: $navigationLinkImportMedia) {
                EmptyView()
            }
            NavigationLink(destination: VoiceNoteView(), isActive: $navigationLinkVoice) {
                EmptyView()
            }
        }
    }
}

struct MainScreenView_Preview: PreviewProvider {
        static var previews: some View {
            MainScreenView()
        }
}

