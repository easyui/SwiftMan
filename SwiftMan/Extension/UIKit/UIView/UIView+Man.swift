//
//  UIView+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit


extension UIView {
    
    
    /// 截图
    ///
    /// - Returns: 截图
    public func m_snapshotImage() -> UIImage{
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        if (self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:)))){
            self.drawHierarchy(in: bounds, afterScreenUpdates: false)
        }else{
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage!
    }
    
    
    /// 删除subView
    public func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    
    /// 调整view的长宽来包容所有subview（不递归）
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
    
    
    /// 调整view的长宽来包容所有subview（递归）
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
    
    /// 自适应宽度
    public func m_resizeToFitWidth() {
        let currentHeight = self.m_height
        self.sizeToFit()
        self.m_height = currentHeight
    }
    
    
    /// 自适应高度
    public func m_resizeToFitHeight() {
        let currentWidth = self.m_width
        self.sizeToFit()
        self.m_width = currentWidth
    }
    
}
