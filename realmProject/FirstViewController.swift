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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }


}

