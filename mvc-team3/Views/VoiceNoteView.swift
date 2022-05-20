//
//  VoiceNoteView.swift
//  mvvm-team03
//
//  Created by Aulia Rahmi on 20/05/22.
//

import SwiftUI

struct VoiceNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Hello, voice")
        }
        .navigationTitle("Voice Note").navigationBarTitleDisplayMode(.inline)
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

struct VoiceNoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoiceNoteView()
    }
}
