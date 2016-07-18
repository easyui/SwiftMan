//
//  UIView+Man.swift
//  SwiftMan
//
//  Created by neu on 16/7/18.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit


extension UIView {
    
    public func m_snapshotImage() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(bounds.size, opaque, 0.0)
        if (self.respondsToSelector(#selector(UIView.drawViewHierarchyInRect(_:afterScreenUpdates:)))){
            self.drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        }else{
            self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        }
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage
    }
    
    
    public func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    
    public func m_resizeToFitSubviews() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            let aView = someView
            let newWidth = aView.m_x + aView.m_width
            let newHeight = aView.m_y + aView.m_height
            width = max(width, newWidth)
            height = max(height, newHeight)
        }
        frame = CGRect(x: m_x, y: m_y, width: width, height: height)
    }
    
    
    
    
    public func m_resizeToFitRecursiveSubviews() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in self.subviews {
            someView.m_resizeToFitRecursiveSubviews()
            let aView = someView
            let newWidth = aView.m_x + aView.m_width
            let newHeight = aView.m_y + aView.m_height
            width = max(width, newWidth)
            height = max(height, newHeight)
        }
        frame = CGRect(x: m_x, y: m_y, width: width, height: height)
    }
    
    public func m_resizeToFitWidth() {
        let currentHeight = self.m_height
        self.sizeToFit()
        self.m_height = currentHeight
    }
    
    public func m_resizeToFitHeight() {
        let currentWidth = self.m_width
        self.sizeToFit()
        self.m_width = currentWidth
    }
    
}