//
//  DisplayVideoViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit

class DisplayVideoViewController: UIViewController {

 
    @IBOutlet weak var video2: UIWebView!
    @IBOutlet weak var video1: UIWebView!
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
Label.text = Utils.selectedWorkout
        getVideo1(videoCode: Utils.gettingMyCode1())
        getVideo2(videoCode: Utils.gettingMyCode2())
        // Do any additional setup after loading the view.
    }

    
func getVideo1(videoCode:String){
        
        let url = URL(string:"https://www.youtube.com/embed/\(videoCode)")
    video1.loadRequest(URLRequest(url:url!))
        
    }
    func getVideo2(videoCode:String){
        
        let url = URL(string:"https://www.youtube.com/embed/\(videoCode)")
        video2.loadRequest(URLRequest(url:url!))
        
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
