//
//  Array+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation

public extension Array {
    
    /// 转JSON
    ///
    /// - Returns: 可选的格式化的JSON字符串
    public func m_prettyJSONString() -> String?{
        return JSONString(option: [.prettyPrinted])
    }
    
    /// 转JSON
    ///
    /// - Returns: 可选的一行JSON字符串
    public func m_JSONStringRepresentation()  -> String?{
        return JSONString(option: [])
    }
    
    /// 转JSON
    ///
    /// - Returns: 可选的JSON字符串
    private func JSONString(option: JSONSerialization.WritingOptions) -> String?{
        do{
            let data = try JSONSerialization.data(withJSONObject: self, options: option)
            return  String(data: data, encoding: String.Encoding.utf8)
        } catch {
            return nil
        }
        
    }
}
