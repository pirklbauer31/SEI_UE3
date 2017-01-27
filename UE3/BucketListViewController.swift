//
//  BucketListViewController.swift
//  UE3
//
//  Created by Student on 27/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import UIKit

class BucketListViewController: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = ""
        
        return cell
    }
}
