//
//  CoreDataHelper.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/26/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData
class CoreDataHelper: NSObject {
    static var photoTemp: NSData? = nil
    
    static var Account_Array: [Acoount_Info] = []
    static var currentUser: Acoount_Info? = nil
    
    class func getMyPlan()->String{
        
        var h = Double((Utils.new_Health_Object?.height)!)
        var w = Double((Utils.new_Health_Object?.weight)!)
        
    print("BMI is")
        var bmi = w!/(h!*0.01)
        print(bmi)
        
        if bmi >= 24.0 && Utils.new_Health_Object?.body_type == "endo"{
            return "light"
        }
        if bmi >= 24.0 && Utils.new_Health_Object?.body_type == "meso"{
            return "hard"
        }
        if bmi >= 24.0 && Utils.new_Health_Object?.body_type == "ecto"{
            return "medium"
        }
        if bmi > 20.0 && bmi < 24 && Utils.new_Health_Object?.body_type == "meso"{
            return "hard"
        }
        if bmi > 20.0 && bmi < 24 && Utils.new_Health_Object?.body_type == "ecto"{
            return "medium"
        }
        if bmi > 20.0 && bmi < 24 && Utils.new_Health_Object?.body_type == "endo"{
            return "medium"
        }
        if bmi <= 20.0 && Utils.new_Health_Object?.body_type == "ecto"{
            return "light"
        }
        if bmi <= 20.0 && Utils.new_Health_Object?.body_type == "meso"{
            return "medium"
        }
        if bmi <= 20.0 && Utils.new_Health_Object?.body_type == "endo"{
            return "hard"
        }
        
        
    return "medium"
    }
    
   

}
