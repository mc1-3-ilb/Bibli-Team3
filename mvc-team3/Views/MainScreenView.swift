import SwiftUI

struct MainScreenView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    @StateObject var vm = BookFolderViewModel()
    @State private var navigationLinkNotes = false
    @State private var navigationLinkImage = false
    @State private var navigationLinkVoice = false
    @State private var showSheet = false
    //contoh dulu
    var data: Int = 1
    //------
    let layout = [
        GridItem(.adaptive(minimum:100))
    ]
    let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext

    var body: some View {
      
        HStack{
            NavigationLink(destination: NoteListView(vm: NoteListViewModel(context: viewContext)), isActive: $navigationLinkNotes) {
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
            
            
        }
            VStack{
                if(data==0){
                    Text("Tap + to add new book folder")
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
                    }.padding(.vertical,10)
                }
            }
            .searchable(text: $searchText, prompt: "Looking for book folder?")
        
        
        .navigationTitle("Book Shelves")
        .foregroundColor(Color("AccentColor"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
                            trailing:
                                Button("Edit") {
                                    print("Waw")
                                }
                        )

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
    
    
    
    struct MainScreenView_Preview: PreviewProvider {
        static var previews: some View {
            MainScreenView()
        }
    }
}
