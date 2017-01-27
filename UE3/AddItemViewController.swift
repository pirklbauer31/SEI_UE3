//
//  AddItemViewController.swift
//  UE3
//
//  Created by Student on 27/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class AddItemViewController: UIViewController {
    
    // Returns the managed object context for the application
    lazy var managedContext: NSManagedObjectContext? = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }()

    
    
    @IBOutlet weak var etxt_content: UITextField!
    
    @IBAction func btn_Done(_ sender: AnyObject) {
        let data = etxt_content.text
        let bucketTask = NSEntityDescription.insertNewObject(forEntityName: "BucketTask", into: self.managedContext!) as! BucketTask
        bucketTask.content = data
        
        
        
        self.performSegue(withIdentifier: "backToBucketList", sender: self)
    }
    
    
    func save() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        appDelegate.saveContext()
    }
}
