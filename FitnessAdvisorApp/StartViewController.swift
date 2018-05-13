//
//  StartViewController.swift
//  FitnessAdvisorApp
//
//  Created by Ankita Vilas Mhatre on 4/26/18.
//  Copyright © 2018 Ankita. All rights reserved.
//

import UIKit
import CoreData
class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Acoount_Info> = Acoount_Info.fetchRequest()
        
        print("Loading core data 1")
        do {
            let user_account = try PersistenceService.context.fetch(fetchRequest)
            CoreDataHelper.Account_Array = user_account
            for u in CoreDataHelper.Account_Array {
                print(u.health_info?.plan_generated)
                print(u.email)
            }
        }catch {
            print("Error Loading Core Data 1")
        }
    fetchData()
    }
    
    func fetchData(){
        let url = "https://food2fork.com/api/search?key=39b74321ddb01ceedbba9208f28509f3&q=shredded%20chicken"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) {(data, response, error) in
            if error != nil {
                
            }else {
                do{
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                    
                    if let response1 = fetchedData.value(forKey: "recipes") as? NSArray{
                        print(response1)//
                        
                        
                        
                        for res in response1{
                            
                            var apiObj = Utils.ApiRecord()
                            
                            if let resDict = res as? NSDictionary {
                                if let name = resDict.value(forKey: "title"){
                                    apiObj.title = name as! String
                                    print(name)
                                }
                                
                                if let name1 = resDict.value(forKey: "publisher"){
                                    apiObj.publisher = name1 as! String
                                    print(name1)
                                }
                                
                                if let name2 = resDict.value(forKey: "image_url"){
                                    apiObj.imageURL = name2 as! String
                                    print(name2)
                                }
                                
                                if let name3 = resDict.value(forKey: "publisher_url"){
                                    apiObj.pubURL = name3 as! String
                                    print(name3)
                                }
                            }
                              Utils.fetchedApiRecord.append(apiObj)
                        }
                        
                      
                    }
                }
                catch {
                    
                }
            }
        }
        
        task.resume()
        
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
