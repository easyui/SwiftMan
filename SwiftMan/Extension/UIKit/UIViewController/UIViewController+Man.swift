//
//  UIViewController+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    // MARK: - add / remove
    public func m_displayController(_ controller: UIViewController, frame: CGRect) {
        self.addChildViewController(controller)
        controller.view.frame = frame
        self.view!.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    public func m_hideController(_ controller: UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    

    
    // MARK: - status bar
    public var  m_statusBarHeight: CGFloat {
        return self.view.window!.convert(UIApplication.shared.statusBarFrame, to: self.view).size.height
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


