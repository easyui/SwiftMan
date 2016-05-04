//
//  NSURL+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension NSURL {
    
    
    public var queryParameters: [String: String]? {
        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: true), queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
}