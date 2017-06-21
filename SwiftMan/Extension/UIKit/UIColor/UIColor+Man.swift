//
//  UIColor+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/4/29.
//  Copyright © 2016年 yangjun. All rights reserved.
//
#if !os(macOS)
import UIKit

public extension UIColor {
    
    /// init
    ///
    /// - Parameters:
    ///   - r: RGB values from 0 to 255, instead of 0 to 1.
    ///   - g: RGB values from 0 to 255, instead of 0 to 1.
    ///   - b: RGB values from 0 to 255, instead of 0 to 1.
    ///   - a: alpha(default:1)
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    /// init?
    ///
    /// - Parameters:
    ///   - hexString: hex string, ex: "0x111111","#111111"
    ///   - alpha: alpha(default:1)
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var formatted = hexString.replacingOccurrences(of: "0x", with: "")
        formatted = formatted.replacingOccurrences(of: "#", with: "")
        if let hex = Int(formatted, radix: 16) {
            self.init(rgbHex: hex, alpha: alpha)
        } else {
            return nil
        }
    }
    
    /// init
    ///
    /// - Parameters:
    ///   - rgbHex: hex int
    ///   - alpha: alpha(default: 1)
    public convenience init(rgbHex: Int, alpha: CGFloat = 1) {
        let red = (rgbHex >> 16) & 0xFF
        let green = (rgbHex >> 8) & 0xFF
        let blue = (rgbHex) & 0xFF
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
    
}
    
public extension UIColor {    
    //  Returns random UIColor with random alpha(default: false)
    
    /// 随机颜色
    ///
    /// - Parameter isRandomAlpha: 透明度随机
    /// - Returns: 返回随机颜色
    public static func m_randomColor(_ isRandomAlpha: Bool = false) -> UIColor {
        func random() -> CGFloat {
            let upper = 255;
            return  CGFloat(arc4random_uniform(UInt32(upper))) / CGFloat(upper)
        }
        let randomRed = random()
        let randomGreen = random()
        let randomBlue = random()
        let alpha = isRandomAlpha ? random() : 1.0
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
    
    
    /// ex: 0x66ccff
    public var m_RGBHex: Int{
        var r: CGFloat = 0 ,g: CGFloat = 0,b: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: nil)
        let red = Int(r * 255)
        let green = Int(g * 255)
        let blue = Int(b * 255)
        return (red << 16) + (green << 8) + blue;
    }
    
    /// ex: 0x66ccffff
    public var m_RGBAHex: Int{
        var r: CGFloat = 0 ,g: CGFloat = 0,b: CGFloat = 0,a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let red = Int(r * 255)
        let green = Int(g * 255)
        let blue = Int(b * 255)
        let alpha = Int(a * 255)
        return (red << 24) + (green << 16) + (blue << 8) + alpha;
    }
    
    
    /// SwifterSwift: Hexadecimal value string (read-only). ex:UIColor.red.m_RGBHexString is #FF0000
    public var m_RGBHexString: String {
        return NSString(format:"#%06x", m_RGBHex).uppercased as String
    }
    
    
    /// ex:UIColor.red.m_RGBAHexString is #FF0000FF
    public var m_RGBAHexString: String{
        return NSString(format:"#%06x", m_RGBAHex).uppercased as String
    }
    
    /// Red of UIColor (get-only)
    public var m_red: CGFloat {
        var red: CGFloat = 0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        return red
    }
    
    /// Green of UIColor (get-only)
    public var m_green: CGFloat {
        var green: CGFloat = 0
        getRed(nil, green: &green, blue: nil, alpha: nil)
        return green
    }
    
    /// blue of UIColor (get-only)
    public var m_blue: CGFloat {
        var blue: CGFloat = 0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        return blue
    }
    
    /// Alpha of UIColor (get-only)
    public var m_alpha: CGFloat {
        // return CGColorGetAlpha(self.CGColor)
        var alpha: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return alpha
    }
    
    
    
}
#endif


