//
//  BasicDetailsViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/26/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData
class BasicDetailsViewController: UIViewController {
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var dRadio: UISegmentedControl!
    
    @IBOutlet weak var pRadio: UISegmentedControl!
    @IBOutlet weak var sRadio: UISegmentedControl!
    @IBOutlet weak var pLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var atxt: UITextField!
    @IBOutlet weak var wtxt: UITextField!
    @IBOutlet weak var htxt: UITextField!
    @IBOutlet weak var hLabel: UILabel!
    
    var smoking: Bool = true
     var getsmoking: Bool = true
    var drinking: Bool = true
    var getdrinking: Bool = true
    var heart: Bool = true
    var getheart: Bool = true
    
    override func viewDidLoad() {
        print(Utils.new_Health_Object?.body_type)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitClicked(_ sender: UIButton) {
        if htxt.text == "" || atxt.text == "" || wtxt.text == ""{
             self.showValidationAlert(reason: "Please Enter All Attributes")
            return
        }else {
            Utils.new_Health_Object?.age = atxt.text!
            Utils.new_Health_Object?.weight = wtxt.text!
            Utils.new_Health_Object?.height = htxt.text!
            Utils.new_Health_Object?.smoking = getsmoking
            Utils.new_Health_Object?.drinking = getdrinking
            Utils.new_Health_Object?.heart_problems = getheart

            performSegue(withIdentifier: "nextStepSegue", sender: self)
        }
        
    }
    
    // get segmented control for smoking
    
    @IBAction func smokingAction(_ sender: UISegmentedControl) {
        smoking = !smoking
        if smoking{
            getsmoking = true
        }else{
            getsmoking = false
        }
    }
    
    
    //get segmeneted control for drinking
    
    @IBAction func drinkingAction(_ sender: UISegmentedControl) {
            drinking = !drinking
        if drinking {
            getdrinking = true
        }else{
            getdrinking = false
        }
        
    }
    
    // get segmented control for heart problems
    
    @IBAction func heartProblems(_ sender: UISegmentedControl) {
        
        heart = !heart
        if heart {
            getheart = true
        }else{
            getheart = false
        }
    }
    
    
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
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
