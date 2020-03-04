//
//  UIBarButtonItem+Man.swift
//  SwiftMan
//
//  Created by yangjun on 2017/6/21.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit


// MARK: - Methods
extension UIBarButtonItem {
    
    /// SwiftMan: Add Target to UIBarButtonItem
    ///
    /// - Parameters:
    ///   - target: target.
    ///   - action: selector to run when button is tapped.
    public func m_addTarget(_ target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
    
}
#endif
