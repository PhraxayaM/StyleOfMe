//
//  Item+CoreDataProperties.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 2/15/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
//    @NSManaged public var date: String?

}


extension Item : Identifiable {

}
