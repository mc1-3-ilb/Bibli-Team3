import SwiftUI

struct MainScreenView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    @StateObject var vm = BookFolderViewModel()
    //contoh dulu
    var data: Int = 1
    //------
    let layout = [
        GridItem(.adaptive(minimum:150))
    ]
    
    var body: some View {
        HStack{
            VStack{
                if(data==0){
                    Text("Tap + to add new book folder")
                }
                else{
                    
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
        }
        
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
                    //print
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    Text("New item")
                })
                
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
