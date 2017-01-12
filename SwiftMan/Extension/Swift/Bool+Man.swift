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

