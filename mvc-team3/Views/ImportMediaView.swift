//
//  ImportMediaView.swift
//  mvvm-team03
//
//  Created by Aulia Rahmi on 20/05/22.
//

import SwiftUI

struct ImportMediaView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ImageViewModel
    @State private var titleImage:String = ""
    @State private var book:String = ""

    var body: some View {

         VStack {
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
                     NavigationLink(destination: BookListView()){       //masih perlu perbaikan, cara agar disabled textfield
                         TextField("Grit >",text: $book).disabled(true)
                     }
                 }.padding(.top)
             }
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
                     vm.source = .library
                     vm.showPhotoPicker()
                 } label: {
                     Text("Import Media").foregroundColor(Color("AccentColor"))
                 }
             }
             Spacer()
         }
         .sheet(isPresented: $vm.showPicker) {
             ImagePickerVC(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                 .ignoresSafeArea()
         }
         .navigationTitle("Import Media").navigationBarTitleDisplayMode(.inline)
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

struct BookListView: View {
    @StateObject var vm = BookFolderViewModel()
    var body: some View {
        List {
            ForEach(vm.savedEntities) { entity in
                //harusnya bisa di select
                Text(entity.titleBook ?? "-")
            }
        }
        
    }
}

//struct ImportMediaView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImportMediaView()
//    }
//}
