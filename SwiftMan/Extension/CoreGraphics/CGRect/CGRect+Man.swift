//
//  CGRect+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/3.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation


import UIKit

public extension CGRect {
    
    /// X value of CGRect's origin
    public var m_x: CGFloat {
        get {
            return self.origin.x
        } set(value) {
            self.origin.x = value
        }
    }
    
    /// Y value of CGRect's origin
    public var m_y: CGFloat {
        get {
            return self.origin.y
        } set(value) {
            self.origin.y = value
        }
    }
    
    /// Width of CGRect's size
    public var m_w: CGFloat {
        get {
            return self.size.width
        } set(value) {
            self.size.width = value
        }
    }
    
    /// Height of CGRect's size
    public var m_h: CGFloat {
        get {
            return self.size.height
        } set(value) {
            self.size.height = value
        }
    }
    
}
