//
//  Note+Extension.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 18/05/22.
//


import Foundation
import CoreData

extension NoteEntity : BaseModel {
    static var all: NSFetchRequest<NoteEntity> {
        let request = NoteEntity.fetchRequest()
        request.sortDescriptors = []
        return request
        
    }
}
