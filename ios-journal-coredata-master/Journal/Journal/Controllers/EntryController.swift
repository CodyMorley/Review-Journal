//
//  EntryController.swift
//  Journal
//
//  Created by Cody Morley on 8/11/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import CoreData

class EntryController {
    var entries: [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        let predicate = NSPredicate(value: true)
        let sortDescriptor = NSSortDescriptor(key: "timeStamp", ascending: false)
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sortDescriptor]
        let context = CoreDataStack.shared.mainContext
        
        do {
            let entries = try context.fetch(fetchRequest)
            return entries
        } catch {
            NSLog("Error fetching Entries from core data: \(error)")
            return [Entry]()
        }
    }
    
    func createEntry(title: String, body: String) {
        Entry(title: title,
              bodyText: body,
              context: CoreDataStack.shared.mainContext)
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Ruh roh. couldn't save your entry: \(error)")
            return
        }
    }
    
    func deleteEntry(_ entry: Entry) {
        let context = CoreDataStack.shared.mainContext
        do {
            context.delete(entry)
            try context.save()
        } catch {
            NSLog("Unable to save managed object context after deleting. \(error)")
            return
        }
    }
}
