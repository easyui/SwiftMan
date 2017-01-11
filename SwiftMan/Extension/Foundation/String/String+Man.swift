//
//  String+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation

extension String {
    ///去掉自己前后空格
    public mutating func m_trim() {
        self = self.m_trimmed()
    }
    
    //／返回去掉前后空格的字符串
    public func m_trimmed() -> String {
        let set : CharacterSet = CharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: set)
    }

}
