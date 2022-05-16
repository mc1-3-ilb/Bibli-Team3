import SwiftUI

struct InsideBookView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    @State private var showingOptions = false
    @State private var navigationLinkNotes = false
  

    //contoh dulu
    var data: Int = 0
    let items = Array(1...5).map({"\($0) Avatar : The Legend of Aang"})
    
    let layout = [
        GridItem(.adaptive(minimum:150))
    ]
    //------
    
    var body: some View {
            HStack{
                  NavigationLink(destination: NoteTakeView(), isActive: $navigationLinkNotes) {
                    EmptyView()
                }
         
                VStack{
                    if(data==0){
                        Text("Tap + to add new note")
                            .foregroundColor(Color(UIColor.black))
        
                    }
                    else{
                        //list note
                    }
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
            .navigationBarItems(trailing: Button(action: {
                print("back")
                showingSheet.toggle()
            }) {
                Label("Add", systemImage: "plus")
            }
                .actionSheet(isPresented: $showingSheet) {
                    ActionSheet(
                        title: Text("Choose notes type"),
                        buttons: [
                            .default(Text("Notes"), action: {
                                
                                withAnimation{
                                    navigationLinkNotes = true}
                            }),

                            .default(Text("Voice Notes"), action: {print ("tapped")
                            }),
                            
                            .default(Text("Take photo"), action: {print ("tapped")
                            }),

                            .default(Text("Import photo"), action: {print ("tapped")
                            }),
                            
                            .cancel()
                            
                        ]
                    )
                    
                    
                    
                }
        )
        
                
    }
}

struct InsideBookView_Preview: PreviewProvider {
    static var previews: some View {
        InsideBookView()
    }
}
