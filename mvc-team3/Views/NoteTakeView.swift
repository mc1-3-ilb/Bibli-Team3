//
//  NoteTakeView.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 14/05/22.
//

import SwiftUI


struct TextFieldCustom: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.gray)
//            .cornerRadius(20)
         //   .shadow(color: .gray, radius: 10)
    }
}
struct NoteTakeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss

    @ObservedObject var vm: TakeNoteViewModel
    
    init(vm: TakeNoteViewModel){
        self.vm = vm
    }
    
    
<<<<<<< Updated upstream
    var body: some View {
        
        NavigationView{
        VStack{
=======
    
    
    var body: some View {
        VStack{
            TextField("Your title here", text: $vm.titleVar)
            
//                .background(Color.gray)
                .padding()
            
                .frame(width: 350, height:50, alignment: .center)
                .font(.title2)
               .border(.gray)
                
            
                .disableAutocorrection(true)
            
>>>>>>> Stashed changes
            
            TextEditor(text: $vm.noteVar)
        
                .padding([.leading, .trailing], 4)
                .frame(width: 350).border(Color.gray)
                .multilineTextAlignment(.leading)
<<<<<<< Updated upstream
=======
//                .border(.gray)
                .disableAutocorrection(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
>>>>>>> Stashed changes
        }
        
    
     
            
        
//        .background(.gray)
//            .edgesIgnoringSafeArea(.all)
        
        .navigationTitle("Notes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: Button(action:{
                dismiss()
            }){
                Text("Cancel")
            },
            trailing: Button(action:{
            vm.save()
            presentationMode.wrappedValue.dismiss()
            
        })
                             {
            Text("Save")
        }
        )
        
        }
        
    }
}

struct NoteTakeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext
        
        NoteTakeView(vm: TakeNoteViewModel(context: viewContext))
    }
}


