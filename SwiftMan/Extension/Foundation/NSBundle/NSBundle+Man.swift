//
//  NSBundle+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/3.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation



public extension NSBundle {
        
    public convenience init?(bundleName: String){
        let bundlePath = NSBundle.mainBundle().pathForResource(bundleName, ofType: "bundle")
        guard bundlePath != nil else{
            return nil
        }
        self.init(path: bundlePath!)
    }
    
}