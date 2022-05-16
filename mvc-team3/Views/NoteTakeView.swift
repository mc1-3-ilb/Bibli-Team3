//
//  NoteTakeView.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 14/05/22.
//

import SwiftUI


struct NoteTakeView: View {
    @State private var noteText :String = ""
    var body: some View {
        
        
        VStack{
            
            TextEditor(text: $noteText)
                .padding([.leading, .trailing], 4)
                .frame(width: 350).border(Color.gray)
                .multilineTextAlignment(.leading)
        }
        
        .navigationTitle("Notes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems( trailing: Button(action:{
            print("save")
            
        })
                             {
            Text("Save")
        }
        )
        
    }
}

struct NoteTakeView_Previews: PreviewProvider {
    static var previews: some View {
        NoteTakeView()
    }
}


