//
//  NoteCoreDataManager.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 18/05/22.
//

import Foundation
import CoreData
class NoteCoreManager {
    let persistentStoreContainer: NSPersistentContainer
    static let shared = NoteCoreManager()
    
    private init () {
        persistentStoreContainer = NSPersistentContainer (name: "NoteDataModel")
        persistentStoreContainer.loadPersistentStores { description, error in if let error = error {
            fatalError("Unable to initialize Core Data\(error)")
        }
     }
        
    }
    
}
