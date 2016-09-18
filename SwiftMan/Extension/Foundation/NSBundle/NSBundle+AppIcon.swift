//
//  NSBundle+AppIcon.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation
public extension Bundle {
    
    public class func m_appIconPath() ->  String?{
        let iconFilename = Bundle.main.object(forInfoDictionaryKey: "CFBundleIconFile")
        guard iconFilename != nil else{
            return nil
        }
        let iconBasename = (iconFilename! as! NSString).deletingPathExtension
        let iconExtension = (iconFilename! as! NSString).pathExtension
        return Bundle.main.path(forResource: iconBasename, ofType: iconExtension)
    }
    
    public class func m_appIcon() ->  UIImage?{
        if let iconPath = Bundle.m_appIconPath(){
            return UIImage(contentsOfFile: iconPath)
            
        }
        return nil
    }
    
}
