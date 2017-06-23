//
//  CGPoint+Man.swift
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


// MARK: - Methods
public extension CGPoint {
    
    /// SwiftMan: Distance from another CGPoint.
    ///
    /// - Parameter point: CGPoint to get distance from.
    /// - Returns: Distance between self and given CGPoint.
    public func m_distance(to point: CGPoint) -> CGFloat {
        return CGPoint.m_distance(from: self, to: point)
    }
    
    /// SwiftMan: Distance between two CGPoints.
    ///
    /// - Parameters:
    ///   - point1: first CGPoint.
    ///   - point2: second CGPoint.
    /// - Returns: distance between the two given CGPoints.
    public static func m_distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat {
        // http://stackoverflow.com/questions/6416101/calculate-the-distance-between-two-cgpoints
        return sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
    }
    
}
