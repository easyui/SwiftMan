//
//  UIAlertController+Man.swift
//  SwiftMan
//
//  Created by neu on 16/7/1.
//  Copyright © 2016年 cactus. All rights reserved.
//


import UIKit


extension UIAlertController{
     public func m_show() {
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(self, animated: true, completion: nil)
    }
}