//
//  SignUpVC.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/25/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData

class SignUpVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func getImage(_ sender: UIButton) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true){
            // after it is complete
        }
    }

    @IBAction func SubmitClicked(_ sender: UIButton) {
        if txtUsername.text!.isEmpty || txtEmail.text!.isEmpty || txtPassword.text!.isEmpty{
        self.showValidationAlert(reason: "Please Enter All Details")
            return
        }else if Utils.uniqueUsername(username: txtUsername.text!){
            self.showValidationAlert(reason: "This Username Already Exists")
            txtUsername.text = ""
            return
        }
        else{
            print("Before creating room object")
            let user = Acoount_Info(context: PersistenceService.context)
            user.username = txtUsername.text!
            user.email = txtEmail.text!
            user.password = txtPassword.text!
            user.profile_picture = CoreDataHelper.photoTemp!
        
            user.isSignedIn = false
            
            PersistenceService.saveContext()
            CoreDataHelper.Account_Array.append(user)
            self.showValidationAlert(reason: "Account Created Successfully")
            for u in CoreDataHelper.Account_Array
            {
                print(u.username)
            }
            imageView.image = nil
            txtUsername.text = ""
            txtEmail.text = ""
            txtPassword.text = ""
            CoreDataHelper.photoTemp = nil
           //  performSegue(withIdentifier: "signupToLoginSegue", sender: self)
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageView.image = image
           CoreDataHelper.photoTemp = UIImagePNGRepresentation(image) as! NSData
        }else{
            // Error
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func throwAlert(reason :String){
        let alert = UIAlertController(title: "Fitness Management App", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showValidationAlert(reason :String){
        let alert = UIAlertController(title: "Fitness Advisor", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
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
