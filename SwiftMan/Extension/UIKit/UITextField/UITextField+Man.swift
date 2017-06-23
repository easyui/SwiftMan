//
//  UITextField+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//
#if os(iOS) || os(tvOS)

import UIKit


public extension UITextField {
    
    public func m_setPlaceholderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ??  "", attributes:[NSForegroundColorAttributeName: color])
    }
}

#endif
