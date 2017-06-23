//
//  UIViewController+Find.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit


public extension UIViewController {
    
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
        guard var window = UIApplication.shared.keyWindow else {
            return nil
        }
        if window.windowLevel != UIWindowLevelNormal {
            let windows = UIApplication.shared.windows
            for tmpWin in windows {
                if tmpWin.windowLevel == UIWindowLevelNormal {
                    window = tmpWin
                    break
                }
            }
        }
        // 2. get current View Controller

        result = window.rootViewController
        
        while let presentedVC = result?.presentedViewController {
            result = presentedVC
        }
        if result is UITabBarController {
            result = (result as? UITabBarController)?.selectedViewController
        }
        while result is UINavigationController && (result as? UINavigationController)?.topViewController != nil{
            result = (result as? UINavigationController)?.topViewController
        }
        return result

    }
    
    public func m_isVisible() -> Bool {
        return self.isViewLoaded && (self.view.window != nil)
    }
    
}
#endif
