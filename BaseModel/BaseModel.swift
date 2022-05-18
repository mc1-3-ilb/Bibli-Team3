//
//  BaseModel.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 18/05/22.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext {get}
    func save() throws
    func delete() throws
}

extension BaseModel where Self: NSManagedObject {
    static var viewContext: NSManagedObjectContext {
        NoteCoreManager.shared.persistentStoreContainer.viewContext
    }
    
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
        
    }
}
