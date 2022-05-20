import SwiftUI

struct TakeImageView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ImageViewModel
    @State private var titleImage:String = ""
    @State private var book:String = ""
    
    var body: some View {
   
        VStack {
            HStack {
                TextField("Title", text: $titleImage)
                        .padding(.horizontal)
                    .padding(.bottom)
            }
               
            HStack{
                Text ("Asign to")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.horizontal)
                Spacer()
                NavigationLink(destination: BookListView()){      //masih perlu perbaikan
                    TextField("Grit >",text: $book).disabled(true)
                }
            }.padding(.top)
        }
        
        VStack {
            if let image = vm.image {
                ZoomableScrollView {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.6)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal)
            }
            HStack {
                Button {
                    vm.source = .camera
                    vm.showPhotoPicker()
                } label: {
                    Text("Camera").foregroundColor(Color("AccentColor"))
                }
            }
            Spacer()
        }
        .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: { cameraError in
            cameraError.button
        }, message: { cameraError in
            Text(cameraError.message)
        })
        .navigationTitle("Take a Photo").navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: Button(action:{
                dismiss()
            }){
                Text("Cancel")
            },
            trailing: Button(action:{
//                 vm.save()
//                 presentationMode.wrappedValue.dismiss()
        })
        {
            Text("Save")
        }
        )
        .navigationBarBackButtonHidden(true)
        
    }
}

struct TakeImageView_Previews: PreviewProvider {
    static var previews: some View {
        TakeImageView()
            .environmentObject(ImageViewModel())
    }
}
