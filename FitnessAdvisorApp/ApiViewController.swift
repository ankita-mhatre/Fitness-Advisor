//
//  ApiViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit

class ApiViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        print(Utils.selectedApi.imageURL)
        textView.text = ("Meal name:\(Utils.selectedApi.title)\n Publisher:\(Utils.selectedApi.publisher)\n Link:\(Utils.selectedApi.pubURL)")
        
        
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
