//
//  CGColor+Man.swift
//  SwiftMan
//
//  Created by yangjun on 2017/6/21.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif


public extension CGColor {
    
    #if !os(macOS)
    /// SwiftMan: UIColor.
    public var m_UIColor: UIColor? {
        return UIColor(cgColor: self)
    }
    #endif
    
    #if os(macOS)
    /// SwiftMan: NSColor.
    public var m_NSColor: NSColor? {
    return NSColor(cgColor: self)
    }
    #endif
    
}
