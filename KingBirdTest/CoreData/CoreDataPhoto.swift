//
//  CoreDataPhoto.swift
//  KingBirdTest
//
//  Created by User on 14.02.2021.
//

import Foundation
import CoreData
class CoreDataPhoto: NSManagedObject{
    @NSManaged public var imgSrc: String
    @NSManaged public var id: Int64
}
