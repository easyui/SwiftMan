//
//  UINavigationBar+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/1.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
    
public extension UINavigationBar {
    
    public func m_setTitleFont(_ font: UIFont, color: UIColor = UIColor.black) {
        var attrs = [String: AnyObject]()
        attrs[NSFontAttributeName] = font
        attrs[NSForegroundColorAttributeName] = color
        titleTextAttributes = attrs
    }
    

    public func m_makeTransparent(withTint: UIColor = .white) {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
        tintColor = withTint
        titleTextAttributes = [NSForegroundColorAttributeName: withTint]
    }
    
    public func m_setColors(background: UIColor, text: UIColor) {
        self.isTranslucent = false
        self.backgroundColor = background
        self.barTintColor = background
        self.setBackgroundImage(UIImage(), for: .default)
        self.tintColor = text
        self.titleTextAttributes = [NSForegroundColorAttributeName: text]
    }
}
#endif
