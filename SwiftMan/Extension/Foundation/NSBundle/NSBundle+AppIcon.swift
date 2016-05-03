//
//  NSBundle+AppIcon.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation
public extension NSBundle {
    
    public class func m_appIconPath() ->  String?{
        let iconFilename = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleIconFile")
        guard iconFilename != nil else{
            return nil
        }
        let iconBasename = iconFilename?.stringByDeletingPathExtension
        let iconExtension = iconFilename?.pathExtension
        return NSBundle.mainBundle().pathForResource(iconBasename, ofType: iconExtension)
    }
    
    public class func m_appIcon() ->  UIImage?{
        if let iconPath = NSBundle.m_appIconPath(){
            return UIImage(contentsOfFile: iconPath)
            
        }
        return nil
    }
    
}