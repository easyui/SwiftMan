//
//  UIViewController+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//
#if canImport(UIKit) && !os(watchOS)
import UIKit
extension UIViewController {
    
//    public final class func m_loadFromNib(nibName: String? = nil, bundle : Bundle? = nil) -> UIViewController {
//        let className =  NSStringFromClass(Self.self)
//        let classType = NSClassFromString(className) as! UIViewController.Type
//        return classType.init(nibName: String(describing: Self.self), bundle: bundle)
//    }
    
    public final class func m_loadFromNib<T:UIViewController>(nibName: String? = nil, bundle : Bundle? = nil) -> T {
        let className =  NSStringFromClass(Self.self)
        let classType = NSClassFromString(className) as! T.Type
        return classType.init(nibName: String(describing: Self.self), bundle: bundle)
    }
    
    // MARK: - add / remove
    public func m_displayController(_ controller: UIViewController, frame: CGRect) {
        self.addChild(controller)
        controller.view.frame = frame
        self.view!.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    
    public func m_hideController(_ controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
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
    
    // MARK: - AlertController
    public func m_showAlertController(title: String?, message: String?,leftButtonTitle: String?, leftButtonhandler: ((UIAlertAction) -> Swift.Void)? = nil,rightButtonTitle: String?, rightButtonhandler: ((UIAlertAction) -> Swift.Void)? = nil , presentAnimated : Bool = true, presentCompletion: (() -> Swift.Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let leftAction = UIAlertAction(title: leftButtonTitle, style: .default, handler: leftButtonhandler)
        leftAction.isEnabled = true
        alertController.addAction(leftAction)
        let rightAction = UIAlertAction(title: rightButtonTitle, style: .default, handler: rightButtonhandler)
        rightAction.isEnabled = true
        alertController.addAction(rightAction)
        self.present(alertController, animated: presentAnimated, completion: presentCompletion)
    }
    
    public func m_showAlertController(title: String?, message: String? = nil ,buttonTitle: String = "确认", buttonhandler: ((UIAlertAction) -> Swift.Void)? = nil , presentAnimated : Bool = true, presentCompletion: (() -> Swift.Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: buttonhandler)
        action.isEnabled = true
        alertController.addAction(action)
        self.present(alertController, animated: presentAnimated, completion: presentCompletion)
    }
    
}

#endif

