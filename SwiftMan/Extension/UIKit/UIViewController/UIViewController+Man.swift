//
//  UIViewController+Man.swift
//  SwiftMan
//
//  Created by neu on 16/7/18.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - add / remove
    public func m_displayController(controller: UIViewController, frame: CGRect) {
        self.addChildViewController(controller)
        controller.view.frame = frame
        self.view!.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
    }
    
    public func m_hideController(controller: UIViewController) {
        controller.willMoveToParentViewController(nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    
    // MARK: - status bar
    public var  m_statusBarHeight: CGFloat {
        return self.view.window!.convertRect(UIApplication.sharedApplication().statusBarFrame, toView: self.view).size.height
    }
    
    // MARK: - navigation bar
    public var m_navigationBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.m_navigationBarHeight
            }
            if let nav = self.navigationController {
                return nav.navigationBar.frame.size.height
            }
            return 0
        }
    }
    
    
    public var m_navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.m_navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
    
    // MARK: - tab bar
    public var m_tabBarHeight: CGFloat {
        get {
            if let me = self as? UINavigationController,
                let visibleViewController = me.visibleViewController {
                return visibleViewController.m_tabBarHeight
            }
            if let tab = self.tabBarController {
                return tab.tabBar.frame.size.height
            }
            return 0
        }
    }
    
}


