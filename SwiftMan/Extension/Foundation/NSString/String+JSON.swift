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
    public func m_JSONObject() -> Any? {
        guard let data = self.data(using: String.Encoding.utf8) else{
            return nil
        }
        
        do {
            let object: Any = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers,.mutableLeaves])
            return object
        } catch let aError as NSError {
            print(aError)
            return nil
        }
    }
    
}
