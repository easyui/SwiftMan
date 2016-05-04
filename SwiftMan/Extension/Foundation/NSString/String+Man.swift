//
//  String+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension String {
    //去掉前后空格
    public mutating func m_trim() {
        self = self.m_trimmed()
    }
    
    //
    public func m_trimmed() -> String {
        let set : NSCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        return self.stringByTrimmingCharactersInSet(set)
    }

}
