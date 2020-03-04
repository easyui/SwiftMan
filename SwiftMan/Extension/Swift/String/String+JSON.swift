//
//  String+JSON.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation


extension String {
    //
    public func m_JSONObject(using: String.Encoding = .utf8, options: JSONSerialization.ReadingOptions =  [.mutableContainers,.mutableLeaves]) -> Any? {
        guard let data = self.data(using: using) else{
            return nil
        }
        
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: options)
            return object
        } catch let aError as NSError {
            print(aError)
            return nil
        }
    }
    
}
