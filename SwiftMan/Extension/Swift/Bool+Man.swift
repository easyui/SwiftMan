//
//  Bool+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation
public extension Bool {
    
    @discardableResult public mutating func m_toggle() -> Bool {
        self = !self
        return self
    }
}


// MARK: - Properties
public extension Bool {
    
    /// SwiftMan: Return 1 if true, or 0 if false.
    public var m_Int: Int {
        return self ? 1 : 0
    }
    
    /// SwiftMan: Return "true" if true, or "false" if false.
    public var m_String: String {
        return description
    }
    
    /// SwiftMan: Return inversed value of bool.
    public var m_toggled: Bool {
        return !self
    }
    
}
