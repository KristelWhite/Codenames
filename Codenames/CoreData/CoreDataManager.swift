//
//  CoreDataManager.swift
//  Codenames
//
//  Created by Кристина Пастухова on 04.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import CoreData
import Foundation

class CoreDataManager {
    
    // Singleton
    static let instance = CoreDataManager()
    
    private init() {}
    
//    // Entity for Name
//    func entityForName(entityName: String) -> NSEntityDescription {
//        return NSEntityDescription.entity(forEntityName: entityName, in: self.context)!
//    }
     // MARK: - Core Data stack
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
   

        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Codenames")
            container.loadPersistentStores(completionHandler: { (description, error) in
                print(description)
                if let error = error {
                    fatalError("Unable to load persistent store: \(error)")
                }
            })
            return container
        }()

        // MARK: - Core Data Saving support

        func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }

    }



