//
//  Dictionary+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension Dictionary {
    public func m_prettyJSONString() -> String?{
        return JSONStringWithOption([.PrettyPrinted])
    }
    
    public func m_JSONStringRepresentation()  -> String?{
        return JSONStringWithOption([])
    }
    
    
    private func JSONStringWithOption(option: NSJSONWritingOptions) -> String?{
        do{
            let data = try NSJSONSerialization.dataWithJSONObject(self as! AnyObject, options: option)
            return  String(data: data, encoding: NSUTF8StringEncoding)
        } catch {
            return nil
        }
        
    }
}