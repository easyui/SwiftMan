//
//  UIView+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit


public extension UIView {
    
    @IBInspectable
    public var m_borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable
    public var m_borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    /// load view from xib
    ///
    /// - Parameters:
    ///   - named: xib的名字
    ///   - bundle: bundle，默认为空
    /// - Returns: view
    public class func m_loadFromNib(named: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(nibName: named, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    /// 截图
    ///
    /// - Returns: 截图
    public func m_snapshotImage() -> UIImage?{
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        if (self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:)))){
            self.drawHierarchy(in: bounds, afterScreenUpdates: false)
        }else{
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage
    }
    
    
    /// 删除subView
    public func removeSubviews() {
        self.subviews.forEach({$0.removeFromSuperview()})
    }
    
    /// 删除手势
    public func removeGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
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
