//
//  Dictionary+CoreDataProperties.swift
//  
//
//  Created by Кристина Пастухова on 04.05.2020.
//
//

import Foundation
import CoreData


extension Dictionary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dictionary> {
        return NSFetchRequest<Dictionary>(entityName: "Dictionary")
    }

    @NSManaged public var type: Bool
    @NSManaged public var name: String?
    @NSManaged public var language: String?
    @NSManaged public var contents: NSSet?

}

// MARK: Generated accessors for contents
extension Dictionary {

    @objc(addContentsObject:)
    @NSManaged public func addToContents(_ value: Content)

    @objc(removeContentsObject:)
    @NSManaged public func removeFromContents(_ value: Content)

    @objc(addContents:)
    @NSManaged public func addToContents(_ values: NSSet)

    @objc(removeContents:)
    @NSManaged public func removeFromContents(_ values: NSSet)

}
