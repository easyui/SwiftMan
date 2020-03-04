//
//  UITextField+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//
#if canImport(UIKit) && !os(watchOS)
import UIKit


extension UITextField {
    
    public func m_setPlaceholderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ??  "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    public var m_clearButton: UIButton {
        let button = self.value(forKey: "_clearButton")
        return button as! UIButton
    }
}

#endif
