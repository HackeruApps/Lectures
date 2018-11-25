//
//  Person+CoreDataProperties.swift
//  Lec12CoreData
//
//  Created by hackeru on 25/11/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//
//

import Foundation
import CoreData

//This file may be overwriten, Don't add code here.
extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int16

}
