//
//  String+JSON.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation


extension String {
    //
    public func m_JSONObject() -> AnyObject? {
        guard let data = self.dataUsingEncoding(NSUTF8StringEncoding) else{
            return nil
        }
        
        do {
            let object: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: [.MutableContainers,.MutableLeaves])
            return object
        } catch let aError as NSError {
            print(aError)
            return nil
        }
    }
    
}