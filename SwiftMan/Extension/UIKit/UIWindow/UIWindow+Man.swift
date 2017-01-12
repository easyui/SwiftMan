//
//  UIWindow+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit


public extension UIWindow {
    
    
    public func m_topMostController() -> UIViewController? {
       var topController = self.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
    
    public func m_currentViewController() -> UIViewController? {
        var currentViewController = self.m_topMostController()
        while currentViewController is UINavigationController && (currentViewController as? UINavigationController)?.topViewController != nil{
            currentViewController = (currentViewController as? UINavigationController)?.topViewController
        }
        return currentViewController
    }
    
}
