//
//  FirstViewController.swift
//  realmProject
//
//  Created by West Kraemer on 4/25/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController {
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)

        // realm object (just get one thing from the database)
//        let e = realm.object(ofType: Employee.self, forPrimaryKey: "53546b12-44e9-452d-89d4-3cd8c8c097c0")
//        if let e = e {
//            employees.append(e)
//            }
//        tableView.reloadData()
//    }
        //realm objectS (get things or a thing by filtering)
        let e = realm.objects(<#T##type: Element.Type##Element.Type#>)
    
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath)
        cell.textLabel?.text = employees[indexPath.row].name
        
        return cell
    }
    
    
    
}

