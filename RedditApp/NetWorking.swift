//
//  NetWorking.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/9/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
class Network {
    
    let defaultSession = URLSession(configuration: .default)
    
    var results: [Reddit] = []
    
    var errorMessage = ""
    
    var dataTask: URLSessionDataTask?
    
    
    func callRedditAPI() {
       
        let string = "https://www.reddit.com/api/v1/access_token"
        let username = "qgMRqMJ8IHLJ_A:"
        
        
        let url = NSURL(string: string)
        let request = NSMutableURLRequest(url: url! as URL)
        
        let loginData = username.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        //let base64BodyString = bodyData.base64EncodedString()
        
        let grant_type =  "https://oauth.reddit.com/grants/installed_client"
        let device_id = "DO_NOT_TRACK_THIS_DEVICE"
        let postString = "grant_type=\(grant_type)&device_id=\(device_id)" // which is your parameters
        //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)

        //request.httpBody = data
        
        print(request.allHTTPHeaderFields!)
        //print(request.httpBody!)
        
        let session = URLSession.shared
        
        let mData = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let res = response as? HTTPURLResponse {
                print("res: \(String(describing: res))")
                print("Response: \(String(describing: response))")
            } else {
                print("Error: \(String(describing: error))")
            }
        }
        mData.resume()

    }


}
