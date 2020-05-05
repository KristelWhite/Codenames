//
//  DataProvider.swift
//  Codenames
//
//  Created by Кристина Пастухова on 04.05.2020.
//  Copyright © 2020 Кристина Пастухова. All rights reserved.
//

//import CoreData
//import UIKit
//
//final class DataProvider {
//
//
//    private let context = CoreDataManager.instance.context
//
//    func loadDictionaryFromCoreData(  onComplite: @escaping ([DictionaryModel]) -> Void, onError: @escaping (Error) -> Void) -> Void {
//        //получить
//        let request: NSFetchRequest<Dictionary> = Dictionary.fetchRequest()
//
//
//        //let request: NSFetchRequest<Dictionary> = Dictionary.fetchRequest()
//       // let request = NSFetchRequest()
//       // request.entity =
////        do {
////            let objects = try context.executeFetchRequest(request)
////        } catch {
////            fatalError("Failed to fetch employees: \(error)")
////        }
////        let predicate = NSPredicate(format: "dictionary.name == %@", name)
////        request.predicate = predicate
//        //request.fetchLimit =
//
//        let contentArray = try? self.context.fetch(request)
//
//        if let content = contentArray, !content.isEmpty {
//
//                let dictModel = content.map {
//                    DictionaryModel(name: $0.name!, type: $0.type, language: $0.language, dictContant: ($0.contents?.allObjects as? [Content])!.map {value in ContentModel(word: value.word, image: UIImage(data: value.image))}
//            }
//               onComplite(dictModel)
//        }
//        else {
//            print("бд пустая по заданому словарю")
//            return
//        }
//    }
//}
