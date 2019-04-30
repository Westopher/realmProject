//
//  SecondViewController.swift
//  realmProject
//
//  Created by West Kraemer on 4/25/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var rolePickerView: UIPickerView!
    
    let roles = ["Designer", "Developer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rolePickerView.dataSource = self
        rolePickerView.delegate = self
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var employees = Employee()
        
        employees.name = nameTextField.text ?? "no name"
        
        employees.role = roles[rolePickerView.selectedRow(inComponent: 0)]
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(employees)
        }
        
        let results = realm.objects(Employee.self)
        
//        for r in results {
//            employees.append(r)
//        }
        
        print("button pressed")
        tableView.reloadData()
   
}
    
}


    extension SecondViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roles[row]
    }
    
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roles.count
    }
    
    
}
