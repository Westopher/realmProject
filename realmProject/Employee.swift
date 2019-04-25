//
//  Employee.swift
//  realmProject
//
//  Created by West Kraemer on 4/25/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation
import RealmSwift

class Employee: Object {
    @objc dynamic var employeeID = UUID().uuidString.lowercased()
    @objc dynamic var name = ""
    @objc dynamic var role = ""
    
    override static func primaryKey() -> String {
        return "employeeID"
    }
    override static func indexedProperties() -> [String] {
        return ["role"]
    }
}
