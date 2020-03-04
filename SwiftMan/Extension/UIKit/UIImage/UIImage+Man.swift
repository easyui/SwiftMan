//
//  UIImage+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/4/29.
//  Copyright © 2016年 yangjun. All rights reserved.
//
#if canImport(UIKit)
import UIKit

extension UIImage {
    
    /// SwiftMan: Create a new image from a base 64 string.
    ///
    /// - Parameters:
    ///   - base64String: a base-64 `String`, representing the image
    ///   - scale: The scale factor to assume when interpreting the image data created from the base-64 string. Applying a scale factor of 1.0 results in an image whose size matches the pixel-based dimensions of the image. Applying a different scale factor changes the size of the image as reported by the `size` property.
    public convenience init?(base64String: String, scale: CGFloat = 1.0) {
        guard let data = Data(base64Encoded: base64String) else { return nil }
        self.init(data: data, scale: scale)
    }
    
    /// SwiftMan: Create a new image from a URL
    ///
    /// - Important:
    ///   Use this method to convert data:// URLs to UIImage objects.
    ///   Don't use this synchronous initializer to request network-based URLs. For network-based URLs, this method can block the current thread for tens of seconds on a slow network, resulting in a poor user experience, and in iOS, may cause your app to be terminated.
    ///   Instead, for non-file URLs, consider using this in an asynchronous way, using `dataTask(with:completionHandler:)` method of the URLSession class or a library such as `AlamofireImage`, `Kingfisher`, `SDWebImage`, or others to perform asynchronous network image loading.
    /// - Parameters:
    ///   - url: a `URL`, representing the image location
    ///   - scale: The scale factor to assume when interpreting the image data created from the URL. Applying a scale factor of 1.0 results in an image whose size matches the pixel-based dimensions of the image. Applying a different scale factor changes the size of the image as reported by the `size` property.
    public convenience init?(url: URL, scale: CGFloat = 1.0) throws {
        let data = try Data(contentsOf: url)
        self.init(data: data, scale: scale)
    }
    
}

extension UIImage{
    
    public var m_bytesSize: Int {
        return self.jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    public var m_kilobytesSize: Int {
        return m_bytesSize / 1024
    }
    
    public func m_compressed(quality: CGFloat = 0.5) -> UIImage? {
        guard let data = m_compressedData(quality: quality) else {
            return nil
        }
        return UIImage(data: data)
    }
    
    public func m_compressedData(quality: CGFloat = 0.5) -> Data? {
        return self.jpegData(compressionQuality: quality)
    }
    
    public static func m_image(color: UIColor , size: CGSize = CGSize(width: 1, height: 1)) -> UIImage
    {
        let imageSize = size;
        UIGraphicsBeginImageContextWithOptions(imageSize, true, 0);
        defer { UIGraphicsEndImageContext() }
        color.set();
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        path.fill()
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    public func m_cropped(to rect: CGRect) -> UIImage {
        guard rect.size.height < self.size.height && rect.size.width < self.size.width else {
            return self
        }
        guard let cgImage: CGImage = self.cgImage?.cropping(to: rect) else {
            return self
        }
        return UIImage(cgImage: cgImage)
    }
    
    public func m_scaled(toHeight: CGFloat) -> UIImage? {
        let scale = toHeight / self.size.height
        let newWidth = self.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: toHeight))
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: toHeight))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public func m_scaled(toWidth: CGFloat) -> UIImage? {
        let scale = toWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: toWidth, height: newHeight))
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(x: 0, y: 0, width: toWidth, height: newHeight))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public func m_filled(withColor color: UIColor) -> UIImage? {
        #if !os(watchOS)
        if #available(iOS 10, tvOS 10, *) {
            let format = UIGraphicsImageRendererFormat()
            format.scale = scale
            let renderer = UIGraphicsImageRenderer(size: size, format: format)
            return renderer.image { context in
                color.setFill()
                context.fill(CGRect(origin: .zero, size: size))
            }
        }
        #endif
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        defer { UIGraphicsEndImageContext() }
        color.setFill()
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        guard let mask = self.cgImage else {
            return self
        }
        context.clip(to: rect, mask: mask)
        context.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    /// SwiftMan: UIImage tinted with color
    ///
    /// - Parameters:
    ///   - color: color to tint image with.
    ///   - blendMode: how to blend the tint
    /// - Returns: UIImage tinted with given color.
    func m_tint(_ color: UIColor, blendMode: CGBlendMode, alpha: CGFloat = 1.0) -> UIImage? {
        let drawRect = CGRect(origin: .zero, size: size)
        
        #if !os(watchOS)
        if #available(iOS 10.0, tvOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            format.scale = scale
            return UIGraphicsImageRenderer(size: size, format: format).image { context in
                color.setFill()
                context.fill(drawRect)
                draw(in: drawRect, blendMode: blendMode, alpha: alpha)
            }
        }
        #endif
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        color.setFill()
        context?.fill(drawRect)
        draw(in: drawRect, blendMode: blendMode, alpha: alpha)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// SwiftMan: UImage with background color
    ///
    /// - Parameters:
    ///   - backgroundColor: Color to use as background color
    /// - Returns: UIImage with a background color that is visible where alpha < 1
    func addedBackgroundColor(_ backgroundColor: UIColor) -> UIImage? {
        
        #if !os(watchOS)
        if #available(iOS 10.0, tvOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            format.scale = scale
            return UIGraphicsImageRenderer(size: size, format: format).image { context in
                backgroundColor.setFill()
                context.fill(context.format.bounds)
                draw(at: .zero)
            }
        }
        #endif
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        backgroundColor.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        draw(at: .zero)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// SwiftMan: Creates a copy of the receiver rotated by the given angle.
    ///
    ///     // Rotate the image by 180°
    ///     image.rotated(by: Measurement(value: 180, unit: .degrees))
    ///
    /// - Parameter angle: The angle measurement by which to rotate the image.
    /// - Returns: A new image rotated by the given angle.
    @available(iOS 10.0, tvOS 10.0, watchOS 3.0, *)
    func m_rotated(by angle: Measurement<UnitAngle>) -> UIImage? {
        let radians = CGFloat(angle.converted(to: .radians).value)
        
        let destRect = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: radians))
        let roundedDestRect = CGRect(x: destRect.origin.x.rounded(),
                                     y: destRect.origin.y.rounded(),
                                     width: destRect.width.rounded(),
                                     height: destRect.height.rounded())
        
        UIGraphicsBeginImageContext(roundedDestRect.size)
        defer { UIGraphicsEndImageContext() }
        guard let contextRef = UIGraphicsGetCurrentContext() else { return nil }
        
        contextRef.translateBy(x: roundedDestRect.width / 2, y: roundedDestRect.height / 2)
        contextRef.rotate(by: radians)
        
        draw(in: CGRect(origin: CGPoint(x: -size.width / 2,
                                        y: -size.height / 2),
                        size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// SwiftMan: Creates a copy of the receiver rotated by the given angle (in radians).
    ///
    ///     // Rotate the image by 180°
    ///     image.rotated(by: .pi)
    ///
    /// - Parameter radians: The angle, in radians, by which to rotate the image.
    /// - Returns: A new image rotated by the given angle.
    func m_rotated(by radians: CGFloat) -> UIImage? {
        let destRect = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: radians))
        let roundedDestRect = CGRect(x: destRect.origin.x.rounded(),
                                     y: destRect.origin.y.rounded(),
                                     width: destRect.width.rounded(),
                                     height: destRect.height.rounded())
        
        UIGraphicsBeginImageContext(roundedDestRect.size)
        defer { UIGraphicsEndImageContext() }
        guard let contextRef = UIGraphicsGetCurrentContext() else { return nil }
        
        contextRef.translateBy(x: roundedDestRect.width / 2, y: roundedDestRect.height / 2)
        contextRef.rotate(by: radians)
        
        draw(in: CGRect(origin: CGPoint(x: -size.width / 2,
                                        y: -size.height / 2),
                        size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    /// 添加圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角
    ///   - size: 长宽
    /// - Returns: 添加圆角后的图片
    func addedCorner(radius: CGFloat) -> UIImage? {
        let rect = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(size.width), height: CGFloat(size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius))
        context.addPath(path.cgPath)
        context.clip()
        self.draw(in: rect)
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// SwiftMan: Base 64 encoded PNG data of the image.
    ///
    /// - returns: Base 64 encoded PNG data of the image as a String.
    func m_pngBase64String() -> String? {
        return pngData()?.base64EncodedString()
    }
    
    /// SwiftMan: Base 64 encoded JPEG data of the image.
    ///
    /// - parameter compressionQuality: The quality of the resulting JPEG image, expressed as a value from 0.0 to 1.0. The value 0.0 represents the maximum compression (or lowest quality) while the value 1.0 represents the least compression (or best quality).
    /// - returns: Base 64 encoded JPEG data of the image as a String.
    func m_jpegBase64String(compressionQuality: CGFloat) -> String? {
        return jpegData(compressionQuality: compressionQuality)?.base64EncodedString()
    }
    
    
}
#endif
