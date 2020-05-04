//
//  AppDelegate.swift
//  Codenames
//
//  Created by Кристина Пастухова on 28.04.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
//        // Создание нового объекта
//            let managedObject = Customer()
//
//            // Установка значения атрибута
//           managedObject.name = "ООО «Колокольчик»"
//
//            // Извлечение значения атрибута
//            let name = managedObject.name
//            print("name = \(name)")
//
//            // Запись объекта
//            CoreDataManager.instance.saveContext()
//
//            // Извление записей
//            let fetchRequest = NSFetchRequest(entityName: "Customer")
//            do {
//                let results = try CoreDataManager.instance.managedObjectContext.executeFetchRequest(fetchRequest)
//                for result in results as! [Customer] {
//                    print("name - \(result.name!)")
//                }
//            } catch {
//                print(error)
//            }
            return true
        }


}
    
