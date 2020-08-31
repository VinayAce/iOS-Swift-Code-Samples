//
//  AceNetworkHelper.swift
//  URLSession
//
//  Created by Apple on 31/08/20.
//  Copyright © 2020 Software Cafe. All rights reserved.
//

import Foundation

class AceNetworkHelper{
    
    let BaseURL = "https://jsonplaceholder.typicode.com"
    let POSTS = "/posts"
    
    static var  instance : AceNetworkHelper? = nil
    
    public static func getInstance() -> AceNetworkHelper{
        if instance == nil {
            instance = AceNetworkHelper()
        }
        return instance!
    }
    
    func postValues(url:String,postdata: [AnyHashable: Any],callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)){
        var request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        let postData = try! JSONSerialization.data(withJSONObject: postdata, options: .prettyPrinted)
        request.httpBody = postData
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
        }
        dataTask.resume()
    }
    
    func getValues(url:String,callBack:@escaping (_ data:Data?,_ error:Error?)->(Void)){
        var request = URLRequest(url: URL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            callBack(data,error)
            print(error ?? "no error")
            
        }
        dataTask.resume()
    }
}

func parseJson(_ data:Data)->[String:Any]{
    if let data =  try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
        return data
    }else{
        print(data.base64EncodedString())
        print(String(bytes: data, encoding: .utf8) ?? "empty")
        return [:]
    }
}
