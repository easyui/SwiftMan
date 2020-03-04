//
//  Dictionary+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//



extension Dictionary {
    
    /// 转JSON
    ///
    /// - Returns: 可选的格式化的JSON字符串
    public func m_prettyJSONString() -> String?{
        return m_JSONString(option: [.prettyPrinted])
    }
    
    /// 转JSON
    ///
    /// - Returns: 可选的一行JSON字符串
    public func m_JSONStringRepresentation()  -> String?{
        return m_JSONString(option: [])
    }
    
    /// 转JSON
    ///
    /// - Returns: 可选的JSON字符串
    public func m_JSONString(option: JSONSerialization.WritingOptions,encoding:String.Encoding = String.Encoding.utf8) -> String?{
        do{
            let data = try JSONSerialization.data(withJSONObject: self, options: option)
            return  String(data: data, encoding: encoding)
        } catch {
            return nil
        }
        
    }
}
