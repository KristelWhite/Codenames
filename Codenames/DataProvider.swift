
  

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
            var dictModels: [DictionaryModel] = []
            for dictionary in dictionaries {
                
                
                let contentSet = dictionary.contents?.allObjects as! [Content]
                var dictModel : DictionaryModel
                if dictionary.type {
                    var array : [String]? = []
                    for word in contentSet {
                        array?.append(word.word!)
                    }
                    dictModel = DictionaryModel(name: dictionary.name!, type: dictionary.type, language: dictionary.language, dictContent: ContentModel(word: array, image: nil))
                    
                } else {
                    var array : [UIImage]? = []
                    for image in contentSet {
                        array?.append(UIImage(data: image.image!)!)
                    }
                    dictModel = DictionaryModel(name: dictionary.name!, type: dictionary.type, language: dictionary.language, dictContent: ContentModel(word: nil, image: array))
                    
                }
                dictModels.append(dictModel)
                
            }
        
                
        onComplite(dictModels)
      

} else {
            print("бд пустая")
            return
        }
    }
}
