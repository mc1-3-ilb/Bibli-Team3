import SwiftUI

struct AddBookView: View {
    @State private var titleBook:String = ""
    @State private var authorBook:String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            HStack{
                Text ("Book Title")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom)
                TextField("Add book title", text: $titleBook)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .padding(.top)
            HStack{
                Text ("Book Author")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal)
                TextField("Add book author", text: $authorBook)
                    .padding(.horizontal)
            }
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
            
        })
                            {
            Text("Save")
        }
        )
    }
}



