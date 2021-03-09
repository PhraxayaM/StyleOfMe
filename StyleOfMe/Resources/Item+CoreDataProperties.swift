//
//  Item+CoreDataProperties.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/2/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var date: String?
    @NSManaged public var entry: String?
    @NSManaged public var name: String?
    @NSManaged public var image: String?

}

extension Item : Identifiable {

}
