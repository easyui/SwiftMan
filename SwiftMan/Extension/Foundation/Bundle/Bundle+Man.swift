//
//  NSBundle+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/3.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation
public extension Bundle {
    
    /// 返回main中bundle
    ///
    /// - Returns: 返回main中可选bundle
    public convenience init?(bundleName: String){
        let bundlePath = Bundle.main.path(forResource: bundleName, ofType: "bundle")
        guard bundlePath != nil else{
            return nil
        }
        self.init(path: bundlePath!)
    }
    
    
}
