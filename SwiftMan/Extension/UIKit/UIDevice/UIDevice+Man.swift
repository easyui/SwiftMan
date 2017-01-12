//
//  UIDevice+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/2.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit

public extension UIDevice {
    // Returns true if the device is iPhone
    public static var  n_isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  n_isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    @available(iOS 9.0, *)
    public static var  n_isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.tv
    }
    
    @available(iOS 9.0, *)
    public static var  n_isCar: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.carPlay
    }
    
    
    
}
