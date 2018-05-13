//
//  MyProfileViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData
class MyProfileViewController: UIViewController {

    @IBOutlet weak var displayText: UITextView!
    var d1: String = ""
    var d2: String = ""
    var d3: String = ""
    var d4: String = ""
    var main: String = ""
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for u in CoreDataHelper.Account_Array{
            if u.username == Utils.sessionUsername{
                d1 = "UserName: \(u.username!) \n"
                d2 = "Email: \(u.email!) \n"
                d3 = "Health Plan Allotted: \((u.health_info?.plan_generated)!) \n"
                
                if let data = u.profile_picture as? Data {
                              imageView.image = UIImage(data: data)
                           }
            }
        }
        
        main = d1 + d2 + d3
        displayText.text = main

        
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
