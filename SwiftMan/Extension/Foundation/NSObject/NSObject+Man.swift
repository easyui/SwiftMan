//
//  NSObject+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation
 extension NSObject {
    public var m_className: String {
        return type(of: self).m_className
    }
    
    public static var m_className: String {
        return String(describing: self)
    }
}
