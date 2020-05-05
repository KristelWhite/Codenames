
  

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

        let contentArray = try? self.context.fetch(request)

        if let content = contentArray, !content.isEmpty {

                
            }
               onComplite(dictModel)
        }
        else {
            print("бд пустая по заданому словарю")
            return
        }
    }
}
