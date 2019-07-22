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
        
        let dataTask = defaultSession.dataTask(with: request) { data, response, error in
            
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

        dataTask.resume()
    }
    
    func fetchThread(completion: @escaping (Result<Thread, Error>) -> ()) {
        let subredditURL = "https://oauth.reddit.com/r/smashbros"
        
        guard let url = URL(string: subredditURL) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
       
        guard let access = UserDefaults.standard.object(forKey:"token") as? String else {
            completion(.failure(NetworkError.invalidAccessToken))
            return
        }

        request.setValue("bearer \(access)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "GET"
        
        let dataTask = defaultSession.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data,
                let thread = try? JSONDecoder().decode(Thread.self, from: data) else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            //data.printAsJSON()
            completion(.success(thread))
        }
        dataTask.resume()
    }
    
//    func getCommentsNetwork(completion: @escaping (Bool) -> ()) {
//        let commentURL = "https://oauth.reddit.com/r/smashbros/comments/c1k3cr/"
//
//        guard let url = URL(string: commentURL) else {
//            completion(false)
//            return
//        }
//
//        var request = URLRequest(url: url)
//
//        let access = UserDefaults.standard.object(forKey:"token") as? String ?? String()
//        
//        request.setValue("bearer \(access)", forHTTPHeaderField: "Authorization")
//        request.httpMethod = "GET"
//
//        let dataTask = defaultSession.dataTask(with: request) { data, response, error in
//            guard error == nil,
//                let data = data else {
//                    completion(false)
//                    return
//            }
//            //let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
//            //print(string1)
//
//            self.getThreadComments(data: data)
//
//            completion(true)
//        }
//        dataTask.resume()
//    }
//
//
//    func getThreadComments(data: Data){
//        guard let comments = try? JSONDecoder().decode(SubRedditComment.self, from: data) else {
//            print("Error: Couldn't decode data into comments")
//            return
//        }
//        print(comments)
//    }
}
