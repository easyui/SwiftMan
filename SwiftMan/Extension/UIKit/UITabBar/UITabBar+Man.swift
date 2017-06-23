//
//  UITabBar+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

public extension UITabBar {
    
    /// Set tabBar colors.
    ///
    /// - Parameters:
    ///   - background: background color.
    ///   - selectedBackground: background color for selected tab.
    ///   - item: icon tint color for items.
    ///   - selectedItem: icon tint color for item.
    public func m_setColors(background: UIColor? = nil,
                          selectedBackground: UIColor? = nil,
                          item: UIColor? = nil,
                          selectedItem: UIColor? = nil) {
        
        // background
        self.barTintColor = background ?? self.barTintColor
        
        // selectedItem
        self.tintColor = selectedItem ?? self.tintColor
        //		self.shadowImage = UIImage()
        self.backgroundImage = UIImage()
        self.isTranslucent = false
        
        // selectedBackgoundColor
        
        if let selectedbg = selectedBackground {
            let rect = CGSize(width: self.frame.width/CGFloat(self.items!.count), height: self.frame.height)
            self.selectionIndicatorImage = UIImage.m_image(color: selectedbg, size: rect)

        }
        
        if let itemColor = item {
            for barItem in self.items! as [UITabBarItem] {
                // item
                if let image = barItem.image {
                    barItem.image = image.m_filled(withColor: itemColor).withRenderingMode(.alwaysOriginal)
                    barItem.setTitleTextAttributes([NSForegroundColorAttributeName : itemColor], for: .normal)
                    if let selected = selectedItem {
                        barItem.setTitleTextAttributes([NSForegroundColorAttributeName : selected], for: .selected)
                    }
                }
            }
        }
    }
}
#endif
