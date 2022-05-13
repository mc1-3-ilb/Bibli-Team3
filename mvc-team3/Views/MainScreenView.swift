//
//  ContentView.swift
//  MC1-SCREENTEST
//
//  Created by Nadia Ramadhani on 11/05/22.
//

import SwiftUI

struct MainScreenView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    var body: some View {
        
        
        HStack{
            VStack{
                Text("Tap + to add new book folder")
                
//                    .searchable(text: $searchText, prompt: "Looking for book folder?")
                
            }.searchable(text: $searchText, prompt: "Looking for book folder?")
            
        }
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            //UIScreen.main.bounds.height)
        )
        
        .navigationTitle("Book Shelves")
        .foregroundColor(Color("AccentColor"))
        .navigationBarItems(trailing: Button(action: {
            print("back")
            showingSheet.toggle()
        }) {
            Label("Add", systemImage: "plus")
        }
            .sheet(isPresented: $showingSheet) {
                AddBookView()
            }
        )
        
        
    }
    
}


struct MainScreenView_Preview: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

