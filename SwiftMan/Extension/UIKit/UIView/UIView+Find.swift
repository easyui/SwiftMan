//
//  UIView+Find.swift
//  SwiftMan
//
//  Created by neu on 16/7/18.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit


extension UIView {
    
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
    
    
    public func m_findSubViewWithClass(_ aClass: AnyClass) -> UIView? {
        for subView in self.subviews {
            if (type(of: subView) === aClass) {
                return subView
            }
        }
        return nil
    }
    
    public func  m_findSuperViewWithClass(_ aClass: AnyClass) -> UIView? {
        guard let parentView = self.superview else {
            return nil
        }
        if (type(of: parentView) === aClass) {
            return parentView
        }
        
        return self.m_findSuperViewWithClass(aClass)
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
