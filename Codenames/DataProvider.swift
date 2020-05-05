
  

import CoreData
import UIKit

final class DataProvider {


    private let context = CoreDataManager.instance.context

    func loadDictionaryFromCoreData(  onComplite: @escaping ([DictionaryModel]) -> Void, onError: @escaping (Error) -> Void) -> Void {
        //получить
        let request: NSFetchRequest<Dictionary> = Dictionary.fetchRequest()


        //let request: NSFetchRequest<Dictionary> = Dictionary.fetchRequest()
       // let request = NSFetchRequest()
       // request.entity =
//        do {
//            let objects = try context.executeFetchRequest(request)
//        } catch {
//            fatalError("Failed to fetch employees: \(error)")
//        }
//        let predicate = NSPredicate(format: "dictionary.name == %@", name)
//        request.predicate = predicate
        //request.fetchLimit =
        

        let dictionaryArray = try? self.context.fetch(request)

        if let dictionaries = dictionaryArray, !dictionaries.isEmpty {
            var dictModels: [DictionaryModel]
            for dictionary in dictionaries {
                var dictModel: DictionaryModel
                dictModel.name = dictionary.name!
                dictModel.language = dictionary.language
                dictModel.type = dictionary.type
                
                var wordSet = dictionary.contents as? [Content]
                if dictModel.type {
                    
                } else {
                    
                }
                
            }
                
            }
               onComplite(dictModels)
        }
        else {
            print("бд пустая")
            return
        }
    }
}
