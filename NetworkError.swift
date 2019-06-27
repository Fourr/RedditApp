//
//  NetworkError.swift
//  RedditApp
//
//  Created by Johnny Sheffer on 6/26/19.
//  Copyright © 2019 johnny. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidAccessToken
    case invalidData
}
