//
//  UIDevice+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/2.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit

extension UIDevice {
    // Returns true if the device is iPhone
    public static var  m_isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  m_isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    @available(iOS 9.0, *)
    public static var  m_isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.tv
    }
    
    @available(iOS 9.0, *)
    public static var  m_isCar: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.carPlay
    }
    
    
    /// 处理顶级（状态栏，导航栏）等 https://stackoverflow.com/questions/46192280/detect-if-the-device-is-iphone-x/47067296
    public static var m_hasTopNotch: Bool {
        // with notch: 44.0 on iPhone X, XS, XS Max, XR.
        // without notch: 24.0 on iPad Pro 12.9" 3rd generation, 20.0 on iPhone 8 on iOS 12+.
        if #available(iOS 13.0,  *){
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 24
        }else if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 24
        }
        return false
    }
    
    /// 处理底部家庭指示器（tabbar）等 https://stackoverflow.com/questions/46192280/detect-if-the-device-is-iphone-x/47067296
    public static var m_hasBottomSafeAreaInsets: Bool {
        // with home indicator: 34.0 on iPhone X, XS, XS Max, XR.
        // with home indicator: 20.0 on iPad Pro 12.9" 3rd generation.
        if #available(iOS 13.0,  *){
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? 0 > 0
        }else if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0 > 0
        }
        return false
    }
    
}
