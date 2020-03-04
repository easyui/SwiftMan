//
//  UIView+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit

extension UIView {
    public static func m_nib() ->  UINib {
        return  UINib(nibName: String(describing: self), bundle: nil)
    }
    
    public static func m_identifier() -> String {
        return  self.m_className + "_m_identifier"
    }
    
    
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
    
    @IBInspectable
    public var m_cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    
    /// SwifterMan: Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    public func m_addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
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
        defer {
            UIGraphicsEndImageContext()
        }
//        if (self.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:)))){
//            self.drawHierarchy(in: bounds, afterScreenUpdates: false)
//        }else{
              guard let context = UIGraphicsGetCurrentContext() else { return nil }
            self.layer.render(in: context)
//        }
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        return snapshotImage
    }
    
    
    /// 删除subView
    public func m_removeSubviews() {
        self.subviews.forEach({$0.removeFromSuperview()})
    }
    
    /// 删除手势
    public func m_removeGestureRecognizers() {
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

#endif
