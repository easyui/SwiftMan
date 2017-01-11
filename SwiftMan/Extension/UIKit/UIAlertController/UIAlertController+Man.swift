//
//  UIAlertController+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/1.
//  Copyright © 2016年 yangjun. All rights reserved.
//


import UIKit


extension UIAlertController{
     public func m_show() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
}
