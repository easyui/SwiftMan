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
    public static var  n_isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  n_isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    

    
}
