//
//  ActionSheetView.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 19/05/22.
//

import SwiftUI

struct ActionSheetView: View {
    @State var showingActionSheet = false
    @State private var navigationLinkNotes = false
    @State private var navigationLinkImage = false
    @State private var navigationLinkVoice = false
    
    let viewContext = NoteCoreManager.shared.persistentStoreContainer.viewContext

    var body: some View {
        Button("click"){
            showingActionSheet.toggle()
        }.actionSheet(isPresented: $showingActionSheet, content: getActionSheet)
        
        HStack{
            NavigationLink(destination: NoteListView(vm: NoteListViewModel(context: viewContext)), isActive: $navigationLinkNotes) {
                EmptyView()
                NoteListView(vm: NoteListViewModel(context: viewContext))
                    .environment(\.managedObjectContext, viewContext)
            }
            
            

            NavigationLink(destination: TakeImageView()
                .environmentObject(ImageViewModel())
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                },
                           isActive: $navigationLinkImage) {
                EmptyView()
            }
        }
            
            
        }
    
    
    public func getActionSheet() -> ActionSheet {
        let button1 : ActionSheet.Button = .default(Text("New Folder"), action: {print ("tapped")
        })

        let button2 : ActionSheet.Button =  .default(Text("Notes"), action: {
            
            withAnimation{
                navigationLinkImage = true}})
        
        let button3 : ActionSheet.Button = .default(Text("Voice Notes"), action:
                                                        {
            withAnimation{
                navigationLinkImage = true}
                                                        })
        let button4 : ActionSheet.Button = .default(Text("Take photo"), action: {print ("tapped")
        })
        
        let button5 : ActionSheet.Button = .default(Text("Import photo"), action: {print ("tapped")
        })
        
        let button6 : ActionSheet.Button = .default(Text("Import photo"), action: {print ("tapped")
        })
        let button7 : ActionSheet.Button = .cancel()
        
        return ActionSheet (
            title: Text("Choose Item Type"),
            buttons: [button1, button2, button3, button4, button5, button6, button7]
            
        )
    }
}

struct ActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetView()
    }
}
