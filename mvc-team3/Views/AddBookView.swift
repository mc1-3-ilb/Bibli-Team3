import SwiftUI


struct AddBookView: View {
    @StateObject var bookvm = BookFolderViewModel()
    @State private var titleBook:String = ""
    @State private var authorBook:String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
      NavigationView{
        VStack {
            HStack{
                Text ("Book Title")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom)
                TextField("Add book title", text: $titleBook)
                    .padding(.horizontal)
                    .padding(.bottom)
                
            }.padding(.top,25)
            HStack{
                Text ("Book Author")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal)
                TextField("Add book author", text: $authorBook)
                    .padding(.horizontal)
            }.padding(.top)
            Spacer()
        }
        .navigationTitle("Add Book")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            print("back")
            dismiss()
        }) {
            Text("Cancel")
        }, trailing: Button(action:{
            print("save")
            guard !titleBook.isEmpty && !authorBook.isEmpty else { return }
            bookvm.addBook(title: titleBook, author: authorBook)
            titleBook = ""
            authorBook = ""
            dismiss()
        }){
            Text("Save")
    
            //GIMANA CARA PAS BALIK KE MAIN SCREEN LANGSUNG REFRESH
        }
        )
      }
        
    }
}

struct addBookView_Preview: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}



