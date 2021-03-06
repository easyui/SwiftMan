//
//  NSDate+Comparable.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//
#if canImport(UIKit)
import Foundation

extension NSDate: Comparable {
    //  Returns if dates are equal to each other
    public static func == (lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs as Date) == .orderedSame
    }
    //  Returns if one date is smaller than the other
    public static func < (lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs as Date) == .orderedAscending
    }

    public static func > (lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs as Date) == .orderedDescending
    }

    public static func <= (lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs as Date) == .orderedAscending || lhs.compare(rhs as Date) == .orderedSame
    }

    public static func >= (lhs: NSDate, rhs: NSDate) -> Bool {
        return lhs.compare(rhs as Date) == .orderedDescending || lhs.compare(rhs as Date) == .orderedSame
    }
}

#endif
