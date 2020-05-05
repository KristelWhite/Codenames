//
//  DataProvider.swift
//  Codenames
//
//  Created by Кристина Пастухова on 04.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

import CoreData
import UIKit

final class DataProvider {
    

    private let context = CoreDataManager.instance.context
    
    func loadDictionaryFromCoreData(name: String,  arrayLabel: inout GameLogic.Content) -> Void {
        //получить
        let request: NSFetchRequest<Content> = Content.fetchRequest()
        
        
        //let request: NSFetchRequest<Dictionary> = Dictionary.fetchRequest()
       // let request = NSFetchRequest()
       // request.entity =
//        do {
//            let objects = try context.executeFetchRequest(request)
//        } catch {
//            fatalError("Failed to fetch employees: \(error)")
//        }
        let predicate = NSPredicate(format: "dictionary.name == %@", name)
        request.predicate = predicate
        //request.fetchLimit =

        let contentArray = try? self.context.fetch(request)

        if let content = contentArray, !content.isEmpty {
            if  content[0].dictionary!.type {
                
            let words = content.map {
//                Dictionary(id: $0.id ?? "", description: $0.desc, urls: .init(regular: $0.url ?? "", small: ""))
                String($0.word!)
            }
               arrayLabel = GameLogic.Content.labels(arrayLabels: words)
                return
            } else {
                let images = content.map {
                    UIImage(data: $0.image!)
                        }
               arrayLabel = GameLogic.Content.images(arrayImages: images as! Array<UIImage>)
                return
            }
        }
        print("бд пустая по заданому словарю")
        return
    }
}
