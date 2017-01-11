//
//  NSBundle+AppIcon.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation
public extension Bundle {
    
    /// 获取多个app icon名字数组
    ///
    /// - Returns: 多个app icon名字的可选数组
    public class func m_appIconsPath() ->  [String]?{
        if let infoDict = Bundle.main.infoDictionary,let bundleIcons = infoDict["CFBundleIcons"] as? [String : Any], let bundlePrimaryIcon = bundleIcons["CFBundlePrimaryIcon"] as? [String : Any], let bundleIconFiles = bundlePrimaryIcon["CFBundleIconFiles"] as? [String]{
            return bundleIconFiles
        }
        return nil
    }
    
    /// 获取app 第一个 icon 图片
    ///
    /// - Returns: app 第一个 icon 图片
    public class func m_appIcon() ->  UIImage?{
        if let iconsPath = Bundle.m_appIconsPath() , iconsPath.count > 0 {
           return  UIImage(named: iconsPath[0])
        }
        return nil
    }
    
}
