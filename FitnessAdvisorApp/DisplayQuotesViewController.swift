//
//  DisplayQuotesViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/28/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit

class DisplayQuotesViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
          showQuote()
        super.viewDidLoad()
      

        // Do any additional setup after loading the view.
    }

   
    
    
    func showQuote(){
        let quotes = ["After dinner rest a while; after supper walk a mile.","Before healing others, heal yourself.","Eat to live, not live to eat.","If you would live long, open your heart. ","One day in perfect health is much.","When one is hungry, everything tastes good.","When the heart is at ease, the body is healthy.","To enjoy the glow of good health, you must exercise.","Good health and good sense are two of life's greatest blessings.","Happiness is nothing more than good health and a bad memory.","All the money in the world can't buy you back good health.","A fit, healthy body - that is the best fashion statement","The greatest wealth is health.","Be careful about reading health books. You may die of a misprint.","Health is not valued till sickness comes.","Health is not simply the absence of sickness.","Take care of your body. It's the only place you have to live."]
        
        let RandomQuoteGen = Int(arc4random_uniform(UInt32(quotes.count)))
        
        textView.text = quotes[RandomQuoteGen]
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
