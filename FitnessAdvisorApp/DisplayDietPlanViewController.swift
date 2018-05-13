//
//  DisplayDietPlanViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit

class DisplayDietPlanViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var displayTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = Utils.selectedDiet
        displayTextView.text = Utils.getDietText()
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
