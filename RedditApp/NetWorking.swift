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
    
    typealias QueryResult = ([Reddit]?, String) -> ()
    typealias JSONDictionary = [String: Any]
    
    func callRedditAPI() {

        dataTask?.cancel()

        if var urlComponents = URLComponents(string: "https://www.reddit.com/api/v1/authorize") {
            urlComponents.query = "client_id=qgMRqMJ8IHLJ_A&response_type=code&state=CylXIShfbC&redirect_uri=http://localhost:8080&duration=permanent&scope=read"
        
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
            
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self.updateSearchResults(data)
                    DispatchQueue.main.async {
                        //completion(Reddit, self.errorMessage)
                    }
                }
            }
        
            dataTask?.resume()
        }
    }
    fileprivate func updateSearchResults(_ data: Data) {
        var response: JSONDictionary?
        results.removeAll()
        //print(data)
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            print(parseError.localizedDescription)
            return
        }
        
        guard let array = response!["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            print("error message two")
            return
        }
        print(response)
        print(array)
    }
}


