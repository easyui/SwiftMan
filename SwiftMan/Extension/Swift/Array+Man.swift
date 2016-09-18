//
//  Array+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension Array {
    public func m_prettyJSONString() -> String?{
        return JSONStringWithOption([.prettyPrinted])
    }
    
    public func m_JSONStringRepresentation()  -> String?{
        return JSONStringWithOption([])
    }
    
    
    fileprivate func JSONStringWithOption(_ option: JSONSerialization.WritingOptions) -> String?{
        do{
            let data = try JSONSerialization.data(withJSONObject: self as AnyObject, options: option)
            return  String(data: data, encoding: String.Encoding.utf8)
        } catch {
            return nil
        }
        
    }
}
