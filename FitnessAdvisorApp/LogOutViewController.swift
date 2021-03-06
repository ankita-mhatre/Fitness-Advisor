//
//  LogOutViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.sessionUsername = ""
        
        Utils.selectedTip = ""
        Utils.selectedExpert = ""
        Utils.selectedWorkout = ""
        Utils.selectedDiet = ""
         Utils.new_Health_Object = Health_Info(context: PersistenceService.context)

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
