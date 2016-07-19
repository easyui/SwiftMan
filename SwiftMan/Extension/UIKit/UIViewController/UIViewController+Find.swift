//
//  UIViewController+Find.swift
//  SwiftMan
//
//  Created by neu on 16/7/18.
//  Copyright © 2016年 cactus. All rights reserved.
//


import UIKit


extension UIViewController {
    
    public func m_topMostController() -> UIViewController {
        var topController: UIViewController = self
        //  Getting topMost ViewController
        while let presentedVC = self.presentedViewController {
            topController = presentedVC
        }
        //  Returning topMost ViewController
        return topController
    }
    
    public func m_currentViewController() -> UIViewController {
        var currentViewController: UIViewController = self.m_topMostController()
        while let topVC = (currentViewController as? UINavigationController)?.topViewController  {
            currentViewController = topVC
        }
        return currentViewController
    }
    
    public class func m_currentViewControllerFromcurrentView() -> UIViewController? {
        var result: UIViewController? = nil
        // 1. get current window
        guard var window = UIApplication.sharedApplication().keyWindow else {
            return nil
        }
        if window.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.sharedApplication().windows
            for tmpWin in windows {
                if tmpWin.windowLevel == UIWindowLevelNormal {
                    window = tmpWin
                }
            }
        }
        // 2. get current View Controller
        let frontView = window.subviews[0]
        let nextResponder = frontView.nextResponder()
        if (nextResponder is UIViewController) {
            result = nextResponder as? UIViewController
        }
        else {
            result = window.rootViewController
        }
        return result
    }
    
    public func m_isVisible() -> Bool {
        return self.isViewLoaded() && (self.view.window != nil)
    }
    
}
