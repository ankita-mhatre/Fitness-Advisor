//
//  ViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/25/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        sideMenus()
         customizeNavBar()
    }


    @IBAction func LogInClicked(_ sender: UIButton) {
        
        if (txtpassword.text!.isEmpty) || txtusername.text!.isEmpty{
            self.showValidationAlert(reason: "Please Enter Username and Password")
            
        }else if Utils.login(username: txtusername.text!, password: txtpassword.text!)
        {
            
            for u in CoreDataHelper.Account_Array{
                if u.username == Utils.sessionUsername{
                    if u.health_info?.plan_generated == nil || u.health_info?.plan_generated == "" || u.health_info == nil{
                         performSegue(withIdentifier: "makePlanSegue", sender: self)
                    }else{
                         performSegue(withIdentifier: "getPlanSegue", sender: self)
                    }
                }
            }
        }else{
            self.showValidationAlert(reason: "Incorrect USername and Password. Try Again!")
            txtusername.text = ""
            txtpassword.text = ""
        }
    }
    
    
    
    
    // alert
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func sideMenus(){
        
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            
            alertButton.target = revealViewController()
            alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }

    func customizeNavBar() {
        
        navigationController?.navigationBar.tintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 87.0/255.0, blue: 35.0/255.0, alpha: 1)
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        
    }


}
