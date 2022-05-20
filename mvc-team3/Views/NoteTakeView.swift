//
//  NoteTakeView.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 14/05/22.
//

import SwiftUI

struct NoteTakeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @State private var noteTitle = ""
    @ObservedObject var vm: TakeNoteViewModel
    
    init(vm: TakeNoteViewModel){
        self.vm = vm
    }
    
    var body: some View {

        VStack{
            TextField("Your title here", text: $vm.titleVar)
                .padding()
                .frame(width: 350, height: 50, alignment: .center)
                .border(Color.gray)
            
            TextEditor(text: $vm.noteVar)
                .padding([.leading, .trailing], 4)
                .frame(width: 350).border(Color.gray)
                .multilineTextAlignment(.leading)
        }
        .navigationTitle("Text Note")
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
        .navigationBarBackButtonHidden(true)
        
    }
}

struct NoteTakeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext
        
        NoteTakeView(vm: TakeNoteViewModel(context: viewContext))
    }
}


