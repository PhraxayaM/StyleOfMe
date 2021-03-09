//
//  CoreDataStorage.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/5/21.
//

import UIKit
import CoreData

class CoreDataStorage: NSObject {

    static let shared = CoreDataStorage()
    private override init() {
    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as  NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var mock: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveJournal(entry: String, date: String, img: String) {
        let journal = JournalEntry(context: mock)
        journal.setValue(entry, forKeyPath: "entry")
        journal.setValue(date, forKeyPath: "date")
        journal.setValue(img, forKeyPath: "img")
        
        do {
            try mock.save()
        } catch {
            print(error)
        }
    }
    
    func saveMilestones(goals: String) {
        let milestones = Milestones(context: mock)
        milestones.setValue(goals, forKeyPath: "goals")
        do {
            try mock.save()
        } catch {
            
            print("save milestone error", error)
        }
    }
    
    func fetchEntries() -> [JournalEntry] {
        do {
            let fetchRequest = NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
            let entries = try mock.fetch(fetchRequest)
            return entries
        } catch {
            print("journal error", error)
            return []
        }
    }
    
    func fetchMilestones() -> [Milestones] {
        do {
            let fetchRequest = NSFetchRequest<Milestones>(entityName: "Milestones")
            let entries = try mock.fetch(fetchRequest)
            return entries
        } catch {
            print("Fetching Milestone error", error)
            return []
        }
    }
    func managedObjectContext() -> NSManagedObjectContext {
        
        return persistentContainer.viewContext
    }
}
