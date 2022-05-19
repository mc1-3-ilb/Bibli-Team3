//
//  NoteListViewModel.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 18/05/22.
//


import Foundation
import CoreData

@MainActor
class NoteListViewModel: NSObject, ObservableObject {
    
    @Published var notes = [NoteViewModel]()
    private let fetchedResultsContoller: NSFetchedResultsController<NoteEntity>
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        
        self.context = context
        fetchedResultsContoller = NSFetchedResultsController(fetchRequest: NoteEntity.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsContoller.delegate = self
        
        
        do {
            try fetchedResultsContoller.performFetch()
            guard let notes = fetchedResultsContoller.fetchedObjects else {
                return
            }
            self.notes = notes.map(NoteViewModel.init)
        } catch {
            print(error)
        }
        
    }
    
}

extension NoteListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let notes = controller.fetchedObjects as? [NoteEntity] else {
            return
        }

        self.notes = notes.map(NoteViewModel.init)
    
    }
    
    
    func deleteNote (noteId: NSManagedObjectID) {
        do {
            guard let note = try context.existingObject(with: noteId) as? NoteEntity else {
                return
            }
            try note.delete()

        } catch {
            print (error)
        }
    }
  
}

struct NoteViewModel: Identifiable {
    
    private var note: NoteEntity
    
    init (note : NoteEntity) {
        self.note = note
    }
    
    var id: NSManagedObjectID {
        note.objectID
    }
    var noteText: String{
        note.noteText ?? ""
        
    }
//    var noteTitle: String {
//        note.noteTitle ?? ""
//    }
    
}
