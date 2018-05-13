//
//  Utils.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/26/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData
// Functions

class Utils: NSObject {
    
    //user logged in
    static var rnum = 0
    static var sessionUsername: String = ""
    static var new_Health_Object: Health_Info? = Health_Info(context: PersistenceService.context)
    static var selectedWorkout: String = ""
    static var selectedDiet: String = ""
    static var selectedExpert: String = ""
    static var selectedTip: String = ""
    static var userLoggedIn = "n"
    static var quickTipsArray: [String] = ["D-Stress","Get head examined","Reboot Your Brain","Juice Your Looks","Be a Dairy Queen"]
    static var dietArray:[String] = ["Breakfast","Lunch","Snack","Dinner"]
    static var exerArray:[String] = ["Cardio","Yoga","Strength Training"]
    static var expertArray:[String] = ["Diet Expert","Trainer","Health Expert"]
    
    // API
    class ApiRecord {
        var title: String = ""
        var publisher: String = ""
        var imageURL: String = ""
        var pubURL: String = ""
    }
    static var fetchedApiRecord = [ApiRecord]()
    static var selectedApi : ApiRecord = ApiRecord()
    
    // unique username
    class func uniqueUsername(username: String)-> Bool{
        for u in CoreDataHelper.Account_Array
        {
            if u.username == username{
                return true
            }
        }
        return false
    }
    
    class func getHealthPlan() -> String{
     var plan = ""
        for u in CoreDataHelper.Account_Array{
            if u.username == Utils.sessionUsername{
                plan = (u.health_info?.plan_generated)!
            }
        }
        return  plan
    }
    
    // login
    class func login(username: String, password: String)-> Bool{
        for u in CoreDataHelper.Account_Array{
            if u.username == username && u.password == password{
                print("in utils func login")
                Utils.sessionUsername = username
                return true
            }
        }
        return false
    }
   
    //diet data
    class func getExpert()->String{
      
        if selectedExpert == "Diet Expert"
        {
            return "Name: Daniel Perara \n Address: 67 Clearway Street, Boston \n Phone: 1234567890"
        }
        if selectedExpert == "Trainer"
        {
             return "Name: Rob Robinson \n Address: 31 Germain Street, Boston \n Phone: 1234567890"
        }
        if selectedExpert == "Health Expert"{
             return "Name: Mike Michaelson \n Address: 51 Huntington Avenue, Boston \n Phone: 1234567890"
        }
        return ""
    }
    
    //getting youtube video codes
    class func gettingMyCode1()-> String {
        var healthp = getHealthPlan()
        if healthp == "light"{
        if selectedWorkout == "Cardio"{
            return "X1TuhAn6C-g"
        }
        
        if selectedWorkout == "Yoga"{
            return "Ci3na6ThUJc"
        }
        
        if selectedWorkout == "Strength Training"{
            return "70GpsTPeNFs"
        }
        }
        if healthp == "hard"{
            if selectedWorkout == "Cardio"{
                return "bYO8V-6IFs0"
            }
            
            if selectedWorkout == "Yoga"{
                return "rOvLwOw-6bc"
            }
            
            if selectedWorkout == "Strength Training"{
                return "qInwSUYvkLY"
            }
        }
        if healthp == "medium"{
            if selectedWorkout == "Cardio"{
                return "eQ5XCtKFF38"
            }
            
            if selectedWorkout == "Yoga"{
                return "BFHsX5mWff8"
            }
            
            if selectedWorkout == "Strength Training"{
                return "U0bhE67HuDY"
            }
        }
        return ""
    }
    
    
    class func gettingMyCode2()-> String {
        var healthp = getHealthPlan()
        if healthp == "light"{
            if selectedWorkout == "Cardio"{
                return "bSZj19AUU5I"
            }
            
            if selectedWorkout == "Yoga"{
                return "B_rXP_bL9jM"
            }
            
            if selectedWorkout == "Strength Training"{
                return "mUns8O4YL5M"
            }
        }
        if healthp == "hard"{
            if selectedWorkout == "Cardio"{
                return "6PXO5Y7M8v8"
            }
            
            if selectedWorkout == "Yoga"{
                return "_jZrcBJpLHU"
            }
            
            if selectedWorkout == "Strength Training"{
                return "VQZJlSAuOTc"
            }
        }
        if healthp == "medium"{
            if selectedWorkout == "Cardio"{
                return "SibjPw9Khz4"
            }
            
            if selectedWorkout == "Yoga"{
                return "6ayTtzS1TCo"
            }
            
            if selectedWorkout == "Strength Training"{
                return "WIHy-ZnSndA"
            }
        }
        
        return ""
    }
 
    
    
    //diet data
    class func getDietText()->String{
        var healthp = getHealthPlan()
        if healthp == "light"
        {
            if selectedDiet == "Breakfast"{
                return "Whole Bread 1 slice \n Peanut butter \n Non fat milk"
            }
            if selectedDiet == "Lunch"{
                return "Brown Rice \n Stirred Vegetables"
            }
            if selectedDiet == "Snack"{
                return "Apples \n 2 Bananas"
            }
            if selectedDiet == "Dinner"{
                return "2Chapatis \n Gravy \n Curd"
            }
        }
        if healthp == "medium"{
            if selectedDiet == "Breakfast"{
                return "Whole Bread 1 slice \n Peanut butter \n Non fat milk"
            }
            if selectedDiet == "Lunch"{
                return "Brown Rice \n Stirred Vegetables"
            }
            if selectedDiet == "Snack"{
                return "Apples \n 2 Bananas"
            }
            if selectedDiet == "Dinner"{
                return "2Chapatis \n Gravy \n Curd"
            }
        }
        if healthp == "hard"{
            if selectedDiet == "Breakfast"{
                return "Boiled Eggs \n 4 Slice Brown Bread \n Glass of Whole Milk(200 ml)"
            }
            if selectedDiet == "Lunch"{
                return "2 Rotis (With ghee) \n 1 Bowl of Rice \n Gravy \n Any Vegetable \n Bowl of Curd"
            }
            if selectedDiet == "Snack"{
                return "Milk \n Biscuit \n Dry Fruits"
            }
            if selectedDiet == "Dinner"{
                return "Grilled Chicken \n Rice \n Chapati (with ghee)"
            }
        }
        return ""
    }
    
}
