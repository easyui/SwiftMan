//
//  UINavigationBar+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/1.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
    
extension UINavigationBar {
    
    public func m_setTitleFont(_ font: UIFont, color: UIColor = UIColor.black) {
        var attrs = [NSAttributedString.Key: Any]()
        attrs[NSAttributedString.Key.font] = font
        attrs[NSAttributedString.Key.foregroundColor] = color
        titleTextAttributes = attrs
    }
    

    public func m_makeTransparent(withTint: UIColor = .white) {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
        tintColor = withTint
        titleTextAttributes = [NSAttributedString.Key.foregroundColor: withTint]
    }
    
    public func m_setColors(background: UIColor, text: UIColor) {
        self.isTranslucent = false
        self.backgroundColor = background
        self.barTintColor = background
        self.setBackgroundImage(UIImage(), for: .default)
        self.tintColor = text
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: text]
    }
}
#endif
