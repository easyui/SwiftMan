//
//  NSBundle+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/3.
//  Copyright © 2016年 yangjun. All rights reserved.
//


#if os(macOS)
    import Cocoa
#else
    import UIKit
#endif


// MARK: - Properties
public extension Data {
    
    /// SwiftMan: NSAttributedString from Data (if applicable).
    public var m_attributedString: NSAttributedString? {
        // http://stackoverflow.com/questions/39248092/nsattributedstring-extension-in-swift-3
        return try? NSAttributedString(data: self, options: [
            NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
            NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
    
    /// SwiftMan: Return data as an array of bytes.
    public var m_bytes: [UInt8] {
        //http://stackoverflow.com/questions/38097710/swift-3-changes-for-getbytes-method
        return [UInt8](self)
    }
}

// MARK: - Methods
public extension Data {
    
    /// SwifterSwift: String by encoding Data using the given encoding (if applicable).
    ///
    /// - Parameter encoding: encoding.
    /// - Returns: String by encoding Data using the given encoding (if applicable).
    public func m_string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
}
