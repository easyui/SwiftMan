//
//  UIImage+Man.swift
//  SwiftMan
//
//  Created by neu on 16/4/29.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit

extension UIImage{
    public static func m_imageWithColor(color: UIColor) -> UIImage
    {
        let imageSize = CGSizeMake(1, 1);
        UIGraphicsBeginImageContextWithOptions(imageSize, true, 0);
        color.set();
        let path = UIBezierPath(rect: CGRectMake(0, 0, imageSize.width, imageSize.height))
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}