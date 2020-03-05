//
//  Bool+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//



extension Bool {
    
}


// MARK: - Properties
extension Bool {
    
    /// SwiftMan: Return 1 if true, or 0 if false.
    public var m_Int: Int {
        return self ? 1 : 0
    }
    
    /// SwiftMan: Return "true" if true, or "false" if false.
    public var m_String: String {
        return description
    }
    
    
}

