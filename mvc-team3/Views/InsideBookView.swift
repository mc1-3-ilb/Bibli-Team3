import SwiftUI

struct InsideBookView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    
    //contoh dulu
    var data: Int = 0
    let items = Array(1...5).map({"\($0) Avatar : The Legend of Aang"})
    
    let layout = [
        GridItem(.adaptive(minimum:150))
    ]
    //------
    
    var body: some View {
        HStack{
            VStack{
                if(data==0){
                    Text("Tap + to add new note")
                }
                else{
                    //list note
                }
            }
            .searchable(text: $searchText, prompt: "Looking for note?")
        }
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .navigationTitle("Avatar : The Legend of Aang")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            print("back")
            showingSheet.toggle()
        }) {
            Label("Add", systemImage: "plus")
        }
            .sheet(isPresented: $showingSheet) {
                AddBookView()       //ganti jadi action sheet untuk option note
            }
        )
                
    }
}

struct AddBookView_Preview: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
