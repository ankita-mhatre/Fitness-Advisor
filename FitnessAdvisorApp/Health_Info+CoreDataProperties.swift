//
//  Health_Info+CoreDataProperties.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//
//

import Foundation
import CoreData


extension Health_Info {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Health_Info> {
        return NSFetchRequest<Health_Info>(entityName: "Health_Info")
    }

    @NSManaged public var age: String?
    @NSManaged public var body_type: String?
    @NSManaged public var drinking: Bool
    @NSManaged public var goal: String?
    @NSManaged public var heart_problems: Bool
    @NSManaged public var height: String?
    @NSManaged public var lifestyle: String?
    @NSManaged public var plan_generated: String?
    @NSManaged public var smoking: Bool
    @NSManaged public var training: String?
    @NSManaged public var weight: String?

}
