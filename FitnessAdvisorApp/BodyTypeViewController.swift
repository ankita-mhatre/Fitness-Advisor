//
//  BodyTypeViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/26/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData

class BodyTypeViewController: UIViewController {
    
    var type=""
    @IBOutlet weak var Label: UILabel!
    

    
    @IBAction func fnecto(_ sender: Any) {
        Utils.new_Health_Object?.body_type = "ecto"
        
        print("Selected ecto")
        print(Utils.new_Health_Object?.body_type)
    }
    
    @IBAction func fnmeso(_ sender: Any) {
         Utils.new_Health_Object?.body_type = "meso"
        print("Selected meso")
    }
    @IBAction func fnendo(_ sender: Any) {
         Utils.new_Health_Object?.body_type = "endo"
        print("Selected endo")
    }
    @IBOutlet weak var mesobtn: UIButton!
    @IBOutlet weak var endobtn: UIButton!
    @IBOutlet weak var ectobtn: UIButton!
    override func viewDidLoad() {
        print("in body type did load")
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
