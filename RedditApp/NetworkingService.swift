//
//  NetWorking.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 5/9/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation
final class NetworkingService {
    
    private struct Constants {
        static let username = "qgMRqMJ8IHLJ_A:"
        static let deviceId = "DO_NOT_TRACK_THIS_DEVICE"
        static let grantType = "https://oauth.reddit.com/grants/installed_client"
    }
    
    private let defaultSession = URLSession(configuration: .default)
    
    private var accessToken: String?
    
    var results: [Reddit] = []
    
    var errorMessage = ""
    
    private var dataTask: URLSessionDataTask?
    
    func authenticate(completion: @escaping (Bool) -> ()) {
        let accessTokenURL = "https://www.reddit.com/api/v1/access_token"
        
        guard let url = URL(string: accessTokenURL) else {
            completion(false)
            return
        }

        var request = URLRequest(url: url)
        
        let utf8UsernameData = Constants.username.data(using: .utf8)!
        let base64UsernameString = utf8UsernameData.base64EncodedString()
        
        let postString = "grant_type=\(Constants.grantType)&device_id=\(Constants.deviceId)"
        
        request.setValue("Basic \(base64UsernameString)",
            forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            
            guard error == nil,
                let data = data else {
                completion(false)
                return
            }
            
            guard let json = (try? JSONSerialization.jsonObject(with: data,
                                                                options: .allowFragments)) as? [String: Any] else {
                                                                    completion(false)
                                                                    return
            }
            
            guard let accessToken = json["access_token"] as? String else {
                completion(false)
                return
            }
            
            self.accessToken = accessToken
            completion(true)
        }
        
        dataTask?.resume()
        
    }
  


}
