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
    
    var errorMessage = ""
    
    private var dataTask: URLSessionDataTask?
    private var dataTask2: URLSessionDataTask?
    
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
            UserDefaults.standard.set(accessToken, forKey:"token")
            completion(true)
        }

        dataTask?.resume()
    }
    
    func getSubbReddit(completion: @escaping (Bool) -> ()) {
        let subredditURL = "https://oauth.reddit.com/r/smashbros"
        
        guard let url = URL(string: subredditURL) else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
       
        let access = UserDefaults.standard.object(forKey:"token") as? String ?? String()

        request.setValue("bearer \(access)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            guard error == nil,
                let data = data else {
                    completion(false)
                    return
            }
            
            self.getSubredditThreads(data: data)
            completion(true)
        }
        dataTask?.resume()
    }
    func getSubredditThreads(data: Data){//-> [SubredditThreads] {
        guard let thread = try? JSONDecoder().decode(SubredditThreads.self, from: data) else {
            print("Error: Couldn't decode data into thread")
            return
        }
        //print(thread)
        for threads in thread.data.children {
            print("\n")
            print("Title: \(threads.data.title)")
            print("URL: \(threads.data.url)")
            print("Permalink: \(threads.data.permalink)")
            
        }

    }
    func getComments(completion: @escaping (Bool) -> ()) {
        let commentURL = "https://oauth.reddit.com/r/smashbros/comments/c1k3cr/"
        
        guard let url = URL(string: commentURL) else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        
        let access = UserDefaults.standard.object(forKey:"token") as? String ?? String()
        
        request.setValue("bearer \(access)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        dataTask = defaultSession.dataTask(with: request) { data, response, error in
            guard error == nil,
                let data = data else {
                    completion(false)
                    return
            }
            let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
            print(string1)
            guard let json = (try? JSONSerialization.jsonObject(with: data,
                                                                options: .allowFragments)) as? [String: Any] else {
                                                                    completion(false)
                                                                    return
            }
            print(json)
            //self.getSubredditThreads(data: data)
            completion(true)
        }
        dataTask?.resume()
    }
    
}
