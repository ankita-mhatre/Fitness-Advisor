//
//  AdditionalDetailsViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/26/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData
class AdditionalDetailsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var life = ["Active", "Sedentary","Highly Active"]
    var val1 = ""
    var val2 = ""
    var val3 = ""
    var trainings = ["Strength Training", "Yoga Training"]
    
    var goals = ["Weight Loss","Weight Gain","Maintain Fitness"]
    
    @IBOutlet weak var gPicker: UIPickerView!
    @IBOutlet weak var tPicker: UIPickerView!
    @IBOutlet weak var lPicker: UIPickerView!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var tLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

//        let fetchRequest: NSFetchRequest<Acoount_Info> = Acoount_Info.fetchRequest()
//
//        print("Loading core data 1")
//        do {
//            let user_account = try PersistenceService.context.fetch(fetchRequest)
//            CoreDataHelper.Account_Array = user_account
//            for u in CoreDataHelper.Account_Array {
//                print(u.health_info.plan_generated)
//                print(u.email)
//            }
//        }catch {
//            print("Error Loading Core Data 1")
//        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView:UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = goals.count
        if pickerView == lPicker {
            
            countrows = self.life.count
        }
        else if  pickerView == tPicker {
            
            countrows = self.trainings.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, forComponent component: Int){
        if pickerView == lPicker {
            
            val1 = life[row]
        }
            
        else if pickerView == gPicker{
            val2 = goals[row]
        }
            
        else if pickerView == tPicker{
            val3 = trainings[row]
        }
     
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == lPicker {
            
            let titleRow = life[row]
            
            return titleRow
            
        }
            
        else if pickerView == gPicker{
            let titleRow = goals[row]
            
            return titleRow
        }
            
        else if pickerView == tPicker{
            let titleRow = trainings[row]
            
            return titleRow
        }
        return ""
    }
    @IBAction func getMyPlanClicked(_ sender: UIButton) {
        var check: Bool = false
        Utils.new_Health_Object?.lifestyle = val1
        Utils.new_Health_Object?.training = val2
        Utils.new_Health_Object?.goal = val3
        var tempString: String = ""
        tempString = CoreDataHelper.getMyPlan()
        print("plan is:")
        print(tempString)
        Utils.new_Health_Object?.plan_generated = tempString
//        if tempString != "" {
//            Utils.sessionUser?.health_info = Utils.new_Health_Object!
//            PersistenceService.saveContext()
//            CoreDataHelper.Account_Array.append(Utils.sessionUser!)
//        }
        print("All health obj data")
    print(Utils.new_Health_Object?.body_type)
         print(Utils.new_Health_Object?.age)
         print(Utils.new_Health_Object?.lifestyle)
        
        let fetchRequest : NSFetchRequest<Acoount_Info> = Acoount_Info.fetchRequest()
        fetchRequest.fetchLimit = 1
        print(Utils.sessionUsername)
        fetchRequest.predicate = NSPredicate(format: "username = %@", argumentArray: [Utils.sessionUsername])
        let temp = try! PersistenceService.context.fetch(fetchRequest)
        for data in temp as [NSManagedObject]{
            let id = data.value(forKey: "username") as! String
            print(id)
            if id == Utils.sessionUsername{
                
                data.setValue(Utils.new_Health_Object, forKey: "health_info")
                
                do{
                    try PersistenceService.context.save()
                    print("here saved")
                } catch{
                    print("error")
                }
            }
            
            
        }
        
        
        
        print("Above")
        }
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
