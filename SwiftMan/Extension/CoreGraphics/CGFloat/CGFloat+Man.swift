//
//  CGFloat+Man.swift
//  SwiftMan
//
//  Created by yangjun on 2017/6/21.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif


// MARK: - Properties
public extension CGFloat {
    
    /// SwiftMan: Absolute of CGFloat value.
    public var m_abs: CGFloat {
        return Swift.abs(self)
    }
    
    /// SwiftMan: Ceil of CGFloat value.
    public var m_ceil: CGFloat {
        return Foundation.ceil(self)
    }
    
    /// SwiftMan: Floor of CGFloat value.
    public var m_floor: CGFloat {
        return Foundation.floor(self)
    }
    
    /// SwiftMan: Degree value of radian input.
    public var m_radiansToDegrees: CGFloat {
        return self * 180 / CGFloat.pi
    }
    
    /// SwiftMan: Radian value of degree input.
    public var m_degreesToRadians: CGFloat {
        return CGFloat.pi * self / 180.0
    }
    
    /// SwiftMan: Int.
    public var m_Int: Int {
        return Int(self)
    }
    
    /// SwiftMan: Float.
    public var m_Float: Float {
        return Float(self)
    }
    
    /// SwiftMan: Double.
    public var m_Double: Double {
        return Double(self)
    }
    
}


// MARK: - Methods
public extension CGFloat {
    
    /// SwiftMan: Random CGFloat between two CGFloat values.
    ///
    /// - Parameters:
    ///   - min: minimum number to start random from.
    ///   - max: maximum number random number end before.
    /// - Returns: random CGFloat between two CGFloat values.
    public static func m_randomBetween(min: CGFloat, max: CGFloat) -> CGFloat {
        let delta = max - min
        return min + CGFloat(arc4random_uniform(UInt32(delta)))
    }
    
}
