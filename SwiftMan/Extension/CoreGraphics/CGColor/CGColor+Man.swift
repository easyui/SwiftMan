//
//  CGColor+Man.swift
//  SwiftMan
//
//  Created by yangjun on 2017/6/21.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics

#if canImport(UIKit)
import UIKit
#endif

#if canImport(AppKit)
import AppKit
#endif


extension CGColor {
    
    #if canImport(UIKit)
    /// SwiftMan: UIColor.
    public var m_UIColor: UIColor? {
        return UIColor(cgColor: self)
    }
    #endif
    
    #if canImport(AppKit) && !targetEnvironment(macCatalyst)
    /// SwiftMan: NSColor.
    public var m_NSColor: NSColor? {
    return NSColor(cgColor: self)
    }
    #endif
    
}

#endif
