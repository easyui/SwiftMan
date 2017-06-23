//
//  UITextField+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//
#if os(iOS) || os(tvOS)

import UIKit

public extension UITextView {
        
    public func m_scrollToBottom() {
        let range = NSMakeRange((text as NSString).length - 1, 1)
        scrollRangeToVisible(range)
    }
        
    public func m_scrollToTop() {
        let range = NSMakeRange(0, 1)
        scrollRangeToVisible(range)
    }
        
}

#endif
