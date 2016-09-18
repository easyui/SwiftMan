//
//  UIImage+Man.swift
//  SwiftMan
//
//  Created by neu on 16/4/29.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit

extension UIImage{
    public static func m_imageWithColor(_ color: UIColor) -> UIImage
    {
        let imageSize = CGSize(width: 1, height: 1);
        UIGraphicsBeginImageContextWithOptions(imageSize, true, 0);
        color.set();
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
