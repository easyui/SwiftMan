//
//  UIScreen+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/4/29.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit


public extension UIScreen {

    
    public var m_mainScreenLongSide: CGFloat {
        let  screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? screenSize.width : screenSize.height;
    }
    
    public var m_mainScreenShortSide: CGFloat {
        let  screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? screenSize.height : screenSize.width;

    }
    

    
}
