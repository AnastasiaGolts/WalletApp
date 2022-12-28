//
//  Transaction+CoreDataProperties.swift
//  
//
//  Created by Anastasia Golts on 28.12.2022.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var amount: Double
    @NSManaged public var type: String?
    @NSManaged public var dayOfTransaction: String?
    @NSManaged public var timeOfTransaction: String?

}
