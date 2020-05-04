//
//  Content+CoreDataProperties.swift
//  
//
//  Created by Кристина Пастухова on 04.05.2020.
//
//

import Foundation
import CoreData


extension Content {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Content> {
        return NSFetchRequest<Content>(entityName: "Content")
    }

    @NSManaged public var word: String?
    @NSManaged public var image: Data?
    @NSManaged public var dictionary: Dictionary?

}
