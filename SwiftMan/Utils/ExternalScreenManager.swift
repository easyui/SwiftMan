//
//  ExternalScreenManager.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/2/13.
//  Copyright © 2017年 cactus. All rights reserved.
//

import Foundation

public enum ExternalScreenStatus{
    case none
    case connected
    case disconnected
}


public extension Notification.Name {
    static let ExternalScreenDidConnected = Notification.Name(rawValue: "com.swiftMan.ExternalScreenDidConnected")
    static let ExternalScreenDidDisconnected = Notification.Name(rawValue: "com.swiftMan.ExternalScreenDidDisconnected")
    static let ExternalViewControllerDidUpdated = Notification.Name(rawValue: "com.swiftMan.ExternalViewControllerDidUpdated")
    
}

public class ExternalScreenManager {
    
    public static let shared = ExternalScreenManager()
    private init(){
        
    }
    
    public var externalScreenStatus  = ExternalScreenStatus.none
    public var externalViewController : UIViewController?
    
    fileprivate var externalWindow: UIWindow?
    
    
    
    fileprivate func didConnectExternalScreen(externalScreen: UIScreen) {
        if externalViewController == nil {
            let viewController =  UIViewController()
            externalViewController = viewController
        }
        if externalWindow == nil {
            let window = UIWindow(frame: externalScreen.bounds)
            externalWindow = window
            externalWindow?.rootViewController = externalViewController
            externalWindow?.isHidden = false
        }
        externalScreenStatus = .connected
        externalWindow?.screen = externalScreen
        NotificationCenter.default.post(name: NSNotification.Name.ExternalScreenDidConnected, object: nil)
    }
    
    fileprivate func didDisconnectScrren(externalScreen: UIScreen) {
        externalScreenStatus = .disconnected
        NotificationCenter.default.post(name: NSNotification.Name.ExternalScreenDidDisconnected, object: nil)
    }
}

extension ExternalScreenManager {
    @discardableResult public func connectExternalScreen() -> Bool{
        if UIScreen.screens.count > 1 {
            for screen in UIScreen.screens {
                if screen != UIScreen.main {
                    self.didConnectExternalScreen(externalScreen: screen)
                    return true
                }
            }
        }
        return false
    }
    
    @discardableResult public func disconnectExternalScreen() -> Bool{
        if self.externalWindow != nil {
            self.externalWindow?.isHidden = true
            self.externalWindow?.removeFromSuperview()
            self.externalWindow = nil
            return true
        }
        return false
    }
    
    
    @discardableResult public func updateExternalViewController(externalViewController:UIViewController,animation:Bool) -> Bool{
        guard self.externalWindow != nil else {
            return false
        }
        self.externalViewController = externalViewController
        self.externalWindow?.rootViewController?.removeFromParentViewController()
        self.externalWindow?.rootViewController?.navigationController?.removeFromParentViewController()
        self.externalWindow?.rootViewController = nil
        self.externalWindow?.rootViewController = self.externalViewController
        self.externalViewController?.view.frame = (self.externalWindow?.bounds)!
        self.externalViewController?.view.layoutIfNeeded()
        if animation {
            let maskView:UIView = UIView(frame: (self.externalViewController?.view.frame)!)
            maskView.backgroundColor = UIColor.black
            self.externalViewController?.view.addSubview(maskView)
            UIView.animate(withDuration: 0.3, animations: {
                maskView.alpha = 0
            }, completion: { (finish:Bool) in
                maskView.removeFromSuperview()
                
            })
        }
        NotificationCenter.default.post(name: NSNotification.Name.ExternalViewControllerDidUpdated, object: nil)
        return true
    }
}
extension ExternalScreenManager {
    
    public func beginObserveExternalScreen() {
        connectExternalScreen()
        NotificationCenter.default.addObserver(self, selector: #selector(self.externalScreenDidConnect(_:)), name: NSNotification.Name.UIScreenDidConnect, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.externalScreenDidDisconnect(_:)), name: NSNotification.Name.UIScreenDidDisconnect, object: nil)
    }
    
    public func stopObserveExternalScreen() {
        NotificationCenter.default.removeObserver(self, name:  NSNotification.Name.UIScreenDidConnect, object: nil)
        NotificationCenter.default.removeObserver(self, name:  NSNotification.Name.UIScreenDidDisconnect, object: nil)
    }
    
    
    @objc func externalScreenDidConnect(_ notifiaction:NSNotification) {
        let screen:UIScreen = notifiaction.object as! UIScreen
        self.didConnectExternalScreen(externalScreen: screen)
    }
    
    @objc func externalScreenDidDisconnect(_ notifiaction:NSNotification) {
        let screen:UIScreen = notifiaction.object as! UIScreen
        self.didDisconnectScrren(externalScreen: screen)
    }
}
