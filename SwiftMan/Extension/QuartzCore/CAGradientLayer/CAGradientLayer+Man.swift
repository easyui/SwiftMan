//
//  CAGradientLayer+Man.swift
//  SwiftMan
//
//  Created by IQIYI on 2020/3/4.
//  Copyright © 2020 cactus. All rights reserved.
//

#if !os(watchOS) && !os(Linux) && canImport(QuartzCore)
import QuartzCore

extension CAGradientLayer {

    convenience init(colors: [UIColor], locations: [CGFloat]? = nil, startPoint: CGPoint, endPoint: CGPoint, type: CAGradientLayerType = .axial) {
        self.init()
        self.colors =  colors.map { $0.cgColor }
        self.locations = locations?.map { NSNumber(value: Double($0)) }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }

}

#endif
