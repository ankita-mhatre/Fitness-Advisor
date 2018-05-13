//
//  Acoount_Info+CoreDataProperties.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//
//

import Foundation
import CoreData


extension Acoount_Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Acoount_Info> {
        return NSFetchRequest<Acoount_Info>(entityName: "Acoount_Info")
    }

    @NSManaged public var email: String?
    @NSManaged public var isSignedIn: Bool
    @NSManaged public var last_login: NSDate?
    @NSManaged public var password: String?
    @NSManaged public var profile_picture: NSData?
    @NSManaged public var username: String?
    @NSManaged public var health_info: Health_Info?

}
