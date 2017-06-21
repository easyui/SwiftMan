//
//  UIButton+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

public extension UIButton{
    
    public convenience init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, target: AnyObject, action: Selector) {
        self.init(frame:CGRect(x: x, y: y, width: width, height: height), target:target,action:action,controlEvents:UIControlEvents.touchUpInside)
    }
    
    
    public convenience init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, target: AnyObject, action: Selector, controlEvents: UIControlEvents) {
        self.init(frame:CGRect(x: x, y: y, width: width, height: height), target:target,action:action,controlEvents:controlEvents)
    }
    
    public convenience init(frame: CGRect, target: AnyObject, action: Selector) {
        self.init(frame:frame, target:target,action:action,controlEvents:UIControlEvents.touchUpInside)
    }
    
    public convenience init(frame: CGRect, target: AnyObject, action: Selector, controlEvents: UIControlEvents) {
        self.init(frame: frame)
        addTarget(target, action: action, for: controlEvents)
    }
}

public extension UIButton{
    /// 设置按钮背景颜色
    ///
    /// - Parameters:
    ///   - color: 背景颜色
    ///   - forState: 按钮状态
    public func m_setBackgroundColor(_ color: UIColor, for state: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: state)
        
    }
    
    private var m_states: [UIControlState] {
        return [.normal, .selected, .highlighted, .disabled]
    }
    
    /// SwiftMan: Set image for all states.
    ///
    /// - Parameter image: UIImage.
    public func m_setImageForAllStates(_ image: UIImage) {
        m_states.forEach { self.setImage(image, for:  $0) }
    }
    
    public func m_setBackgroundImageForAllStates(_ image: UIImage) {
        m_states.forEach { self.setBackgroundImage(image, for:  $0) }
    }
    
    public func m_setBackgroundColorForAllStates(_ color: UIColor) {
        m_states.forEach { self.m_setBackgroundColor(color, for:  $0) }
    }
    
    /// SwiftMan: Set title color for all states.
    ///
    /// - Parameter color: UIColor.
    public func m_setTitleColorForAllStates(_ color: UIColor) {
        m_states.forEach { self.setTitleColor(color, for: $0) }
    }
    
    /// SwiftMan: Set title for all states.
    ///
    /// - Parameter title: title string.
    public func m_setTitleForAllStates(_ title: String) {
        m_states.forEach { self.setTitle(title, for: $0) }
    }
}
#endif

