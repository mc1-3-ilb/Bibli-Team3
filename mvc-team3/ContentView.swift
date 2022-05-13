//
//  ContentView.swift
//  MC1-SCREENTEST
//
//  Created by Nadia Ramadhani on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            HStack{
            Text("Tap + to add new book folder")
         
                .searchable(text: $searchText, prompt: "Looking for book folder?")
            }
            .navigationTitle("Book Shelves")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
