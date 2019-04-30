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
    
    var employees:Results<Employee>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure segmented control
       // segmentedController.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        
        
        let realm = try! Realm()
        let results = realm.objects(Employee.self)
        employees = results
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
       
//        @objc func segmentChanged() {
//            switch  {
//            case 0:
//
//            case 1:
//
//            case 2:
//            default:
//
//            }
//        }
        
        func retrieveEmployees(role: String) {
            let realm = try! Realm()
            employees = realm.objects(Employee.self).filter("role = %@", role)
            tableView.reloadData()
        }
        
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees == nil ? 0 : employees!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath)
            if employees != nil {
                cell.textLabel?.text = employees?[indexPath.row].name
            }
        
        
        return cell
    }
    
    
    
}

