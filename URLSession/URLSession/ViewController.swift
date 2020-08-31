//
//  ViewController.swift
//  URLSession
//
//  Created by Apple on 31/08/20.
//  Copyright © 2020 Software Cafe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let network = AceNetworkHelper.getInstance()
    
    @IBOutlet weak var textViewData: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapHere(_ sender: Any) {
        
        let url = network.BaseURL+network.POSTS
        
        network.getValues(url: url) { (data, error) -> (Void) in
            if(error == nil){
                do{
                    let jsonData =  try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String:Any]]
                    print(jsonData,"Json");
                    
                    jsonData.forEach{
                        title in
                        let lastTitle = title["title"] as! String
                        
                        DispatchQueue.main.async{
                            self.textViewData.text = lastTitle
                            
                        }
                    }
                    
                    
                }
            }
        }
        
    }
}

