//
//  UIView+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit


public extension UIView {
    
    // MARK: -  Frame get/set shorthand
    
    public var m_x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.m_y, width: self.m_width, height: self.m_height)
        }
    }
    
    
    public var m_y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.m_x, y: value, width: self.m_width, height: self.m_height)
        }
    }
    
    
    public var m_width: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.m_x, y: self.m_y, width: value, height: self.m_height)
        }
    }
    
    
    public var m_height: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.m_x, y: self.m_y, width: self.m_width, height: value)
        }
    }
    
    
    public var m_left: CGFloat {
        get {
            return self.m_x
        } set(value) {
            self.m_x = value
        }
    }
    
    
    public var m_right: CGFloat {
        get {
            return self.m_x + self.m_width
        } set(value) {
            self.m_x = value - self.m_width
        }
    }
    
    
    public var m_top: CGFloat {
        get {
            return self.m_y
        } set(value) {
            self.m_y = value
        }
    }
    
    
    public var m_bottom: CGFloat {
        get {
            return self.m_y + self.m_height
        } set(value) {
            self.m_y = value - self.m_height
        }
    }
    
    public var m_origin: CGPoint {
        get {
            return self.frame.origin
        } set(value) {
            self.frame = CGRect(origin: value, size: self.frame.size)
        }
    }
    
    public var m_size: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame = CGRect(origin: self.frame.origin, size: value)
        }
    }
    
    public var m_centerX: CGFloat {
        get {
            return self.center.x
        } set(value) {
            self.center.x = value
        }
    }
    
    
    public var m_centerY: CGFloat {
        get {
            return self.center.y
        } set(value) {
            self.center.y = value
        }
    }
    
    
    
    
    // MARK: - view methods
    public var m_viewGetWidth: CGFloat{
        if ((NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)) {
            return  self.frame.width
        }else{
            return UIDeviceOrientationIsLandscape(UIDevice.current.orientation) ? self.frame.height : self.frame.width
        }
    }
    
    public var m_viewGetHeight: CGFloat{
        if ((NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)) {
            return  self.frame.height;
        }else{
            return UIDeviceOrientationIsLandscape(UIDevice.current.orientation) ? self.frame.width : self.frame.height;
        }
    }
    
    // MARK: - Additional setters
    
    
    public func m_alignCenterX() {
        guard let parentView = superview else {
            assertionFailure("SwiftMan Error: The view \(self) doesn't have a superview")
            return
        }
        var center = self.center;
        center.x = parentView.frame.size.width * 0.5;
        self.center = center;
    }
    
    
    public func m_alignCenterY() {
        guard let parentView = superview else {
            assertionFailure("SwiftMan Error: The view \(self) doesn't have a superview")
            return
        }
        var center = self.center;
        center.y = parentView.frame.size.height * 0.5;
        self.center = center;
    }
    
    
    public func m_alignCenter() {
        guard let parentView = superview else {
            assertionFailure("SwiftMan Error: The view \(self) doesn't have a superview")
            return
        }
        var center = self.center;
        center.x = parentView.frame.size.width * 0.5;
        center.y = parentView.frame.size.height * 0.5;
        self.center = center;
    }
    
    
    public func m_alignRight() {
        guard let parentView = superview else {
            assertionFailure("SwiftMan Error: The view \(self) doesn't have a superview")
            return
        }
        var frame = self.frame;
        frame.origin.x = parentView.frame.size.width - frame.size.width;
        self.frame = frame;
    }
    
    public func m_alignBottom() {
        guard let parentView = superview else {
            assertionFailure("SwiftMan Error: The view \(self) doesn't have a superview")
            return
        }
        var frame = self.frame;
        frame.origin.y = parentView.frame.size.height - frame.size.height;
        self.frame = frame;
    }
    
    
    
    public func m_setMargins(_ margins: UIEdgeInsets)
    {
        guard let parentView = superview else {
            assertionFailure("SwiftMan Error: The view \(self) doesn't have a superview")
            return
        }
        let superSize = parentView.frame.size;
        self.frame = CGRect(x: margins.left,
                            y: margins.top,
                            width: superSize.width - (margins.left + margins.right),
                            height: superSize.height - (margins.top + margins.bottom));
    }
    
    
    
}
