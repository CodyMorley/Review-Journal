//
//  CoreDataStack.swift
//  Journal
//
//  Created by Cody Morley on 8/11/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Journal")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}

