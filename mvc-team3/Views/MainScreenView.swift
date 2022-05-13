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
    //contoh dulu
    var data: Int = 3
    let items = Array(1...5).map({"\($0) Avatar : The Legend of Aang"})
    
    let layout = [
        GridItem(.adaptive(minimum:150))
    ]
    //------
    
    var body: some View {
        HStack{
            VStack{
                if(data==0){
                    Text("Tap + to add new book folder")
                }
                else{
                    ScrollView(.vertical){
                        LazyVGrid(columns: layout, content: {
                            ForEach(items, id: \.self){ item in
                                NavigationLink(destination: InsideBookView()){
                                    VStack {
                                        Image("bookSmall")
                                            .resizable()
                                            .frame(width: 110, height: 140)
                                        Text(item).bold().foregroundColor(.black)
                                            .font(.caption)
                                            .padding(.horizontal)
                                        Text("12 items").foregroundColor(.secondary).font(.caption2)
                                            .padding(.bottom)
                                    }
                                }
                            }
                        })
                    }
                }
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

struct InsideBookView: View{
    var body: some View {
        Text("OK")
    }
}


struct MainScreenView_Preview: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

