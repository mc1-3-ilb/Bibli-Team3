//
//  TakeNoteViewModel.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 18/05/22.
//

import Foundation
import CoreData
class TakeNoteViewModel: ObservableObject{
    
    @Published var noteVar: String = ""
    @Published var titleVar: String = ""
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        
    }
    
    func save() {
        do{
            let note = NoteEntity(context:  context)
            note.noteText = noteVar
            try note.save()
            
            
   
        } catch {
            print(error)
        }
    }
}
