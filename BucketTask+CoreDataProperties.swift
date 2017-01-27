//
//  BucketTask+CoreDataProperties.swift
//  UE3
//
//  Created by Student on 27/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData


extension BucketTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BucketTask> {
        return NSFetchRequest<BucketTask>(entityName: "BucketTask");
    }

    @NSManaged public var content: String?

}
