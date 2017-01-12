//
//  UIView+Find.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit


public extension UIView {
    
    
    /// 返回view依赖的viewController
    public var m_viewController: UIViewController? {
        get {
            var responder = self as UIResponder
            while let nextResponder = responder.next {
                if (responder is UIViewController) {
                    return (responder as! UIViewController)
                }
                responder = nextResponder
            }
            return nil
        }
    }
    
    
    /// 查找aClass类型的subview（没递归）
    ///
    /// - Parameter aClass: 类的类型
    /// - Returns: 查找aClass类型的subview
    public func m_findSubView(aClass: AnyClass) -> UIView? {
        for subView in self.subviews {
            if (type(of: subView) === aClass) {
                return subView
            }
        }
        return nil
    }
    
    
    /// 查找aClass类型的superview
    ///
    /// - Parameter aClass: 类的类型
    /// - Returns: 查找aClass类型的superview
    public func  m_findSuperView(aClass: AnyClass) -> UIView? {
        guard let parentView = self.superview else {
            return nil
        }
        if (type(of: parentView) === aClass) {
            return parentView
        }
        
        return self.m_findSuperView(aClass: aClass)
    }
    
    public func  m_findAndResignFirstResponder() -> Bool {
        if self.isFirstResponder {
            self.resignFirstResponder()
            return true
        }
        for v in self.subviews {
            if v.m_findAndResignFirstResponder() {
                return true
            }
        }
        return false
    }
    
    public func  m_findFirstResponder() -> UIView? {
        if (self is UITextField || self is UITextView) && self.isFirstResponder{
            return self
        }
        for v: UIView in self.subviews {
            let fv = v.m_findFirstResponder()
            if fv != nil {
                return fv
            }
        }
        return nil
    }
    
    
    
}
