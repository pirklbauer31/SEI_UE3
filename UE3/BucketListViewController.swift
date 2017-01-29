//
//  BucketListViewController.swift
//  UE3
//
//  Created by Student on 27/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BucketListViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    
    // Returns the managed object context for the application
    lazy var managedContext: NSManagedObjectContext? = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    lazy var fetchedResultsController: NSFetchedResultsController<NSManagedObject> = {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "BucketTask")
        request.fetchBatchSize = 20
        request.fetchLimit = 100
        let sortDescriptor = NSSortDescriptor(key: "content", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        let frc = NSFetchedResultsController<NSManagedObject>(fetchRequest: request, managedObjectContext:
            self.managedContext!, sectionNameKeyPath: nil, cacheName: "Cache")
        frc.delegate = self
        
        // perform initial model fetch
        do {
            try frc.performFetch()
        } catch let e as NSError {
            print("Fetch error: \(e.localizedDescription)")
            abort();
        }
        return frc
    }()

    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchedResultsController.sections {
            return sections.count
        }
        return 0 }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        return 0 }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let bucketTask = self.fetchedResultsController.object(at: indexPath) as! BucketTask
        
        cell.textLabel?.text = bucketTask.content
        
        return cell
    }
    
    //override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    //}
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let bucketTaskEntity = "BucketTask"
            let managedContext = self.managedContext!
            let bucketTask = self.fetchedResultsController.object(at: indexPath) as! BucketTask
            
            managedContext.delete(bucketTask)
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Error While Deleting Note: \(error.userInfo)")
            }
            
            //let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: bucketTaskEntity)
            
            
        }
        
    }
    
    
    
    //Controller Delegate
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            case .insert:
                self.tableView.insertRows(at: [newIndexPath!], with: .fade)
                break
            case .delete:
                self.tableView.deleteRows(at: [indexPath!], with: .fade)
                break
            case .update:
                break
            case .move:
                break
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }

    
}
