//
//  Data+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/3.
//  Copyright © 2016年 yangjun. All rights reserved.
//


#if canImport(UIKit)
import UIKit


// MARK: - Properties
extension Data {
    
    /// SwiftMan: NSAttributedString from Data (if applicable).
    public var m_attributedString: NSAttributedString? {
        // http://stackoverflow.com/questions/39248092/nsattributedstring-extension-in-swift-3
        return try? NSAttributedString(data: self, options: [
            NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
    
    /// SwiftMan: Return data as an array of bytes.
    public var m_bytes: [UInt8] {
        //http://stackoverflow.com/questions/38097710/swift-3-changes-for-getbytes-method
        return [UInt8](self)
    }
}

// MARK: - Methods
extension Data {
    
    /// SwiftMan: String by encoding Data using the given encoding (if applicable).
    ///
    /// - Parameter encoding: encoding.
    /// - Returns: String by encoding Data using the given encoding (if applicable).
    public func m_string(encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String(data: self, encoding: encoding)
    }
    
    public func m_JSONObject(using: String.Encoding = .utf8, options: JSONSerialization.ReadingOptions =  [.mutableContainers,.mutableLeaves]) -> Any? {        
        do {
            let object = try JSONSerialization.jsonObject(with: self, options: options)
            return object
        } catch let aError as NSError {
            print(aError)
            return nil
        }
    }
    
}
#endif
