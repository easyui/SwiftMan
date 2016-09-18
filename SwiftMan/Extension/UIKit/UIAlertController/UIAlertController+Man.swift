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
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
}
