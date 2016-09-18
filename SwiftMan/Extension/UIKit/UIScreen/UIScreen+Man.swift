//
//  UIScreen+Man.swift
//  SwiftMan
//
//  Created by neu on 16/4/29.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit


extension UIScreen {

    
    public var m_mainScreenLongSide: CGFloat {
        let  screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? screenSize.width : screenSize.height;
    }
    
    public var m_mainScreenShortSide: CGFloat {
        let  screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? screenSize.height : screenSize.width;

    }
    

    
}
