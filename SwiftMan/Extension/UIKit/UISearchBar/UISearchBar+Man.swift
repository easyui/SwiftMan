//
//  UISearchBar+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if canImport(UIKit) && os(iOS)
import UIKit


extension UISearchBar {
    
    ///  Text field inside search bar (if applicable).
    public var m_textField: UITextField? {
        if #available(iOS 13.0, *) {
                return searchTextField
        }
        
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    

    
}
#endif
