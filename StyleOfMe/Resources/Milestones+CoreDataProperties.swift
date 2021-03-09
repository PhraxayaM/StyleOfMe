//
//  Milestones+CoreDataProperties.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/7/21.
//
//

import Foundation
import CoreData


extension Milestones {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Milestones> {
        return NSFetchRequest<Milestones>(entityName: "Milestones")
    }

    @NSManaged public var goals: String?

}

extension Milestones : Identifiable {

}
