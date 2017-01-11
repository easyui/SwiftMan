//
//  UIImage+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/4/29.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit

extension UIImage{
    public static func m_image(color: UIColor) -> UIImage
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
