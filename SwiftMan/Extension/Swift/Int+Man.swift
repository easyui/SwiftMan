//
//  Int+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//


extension Int { 
    public var m_isEven:Bool     {return (self % 2 == 0)}
    public var m_isOdd:Bool      {return (self % 2 != 0)}
    
    public var m_toDouble:Double {return Double(self)}
    public var m_toFloat:Float   {return Float(self)}
    
    public static func m_randomBetween(min: Int, max: Int) -> Int {
        let delta = max - min
        return min + Int(arc4random_uniform(UInt32(delta)))
    }
}
