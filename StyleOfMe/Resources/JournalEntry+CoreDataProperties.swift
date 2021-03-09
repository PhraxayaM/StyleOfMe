//
//  JournalEntry+CoreDataProperties.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/5/21.
//
//

import Foundation
import CoreData


extension JournalEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntry> {
        return NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
    }

    @NSManaged public var date: String?
    @NSManaged public var entry: String?
    @NSManaged public var img: String?

}

extension JournalEntry : Identifiable {

}
