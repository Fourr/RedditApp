//
//  Double+Utility.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/27/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation

extension Double {
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }

    func formatNumber(_ n: Int) -> String {
    
        let num = abs(Double(n))
        let sign = (n < 0) ? "-" : ""
    
        switch num {
        
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)B"
        
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)M"
        
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)K"
        
        case 0...:
            return "\(n)"
        
        default:
            return "\(sign)\(n)"
        
        }
    }
}
