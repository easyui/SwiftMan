//
//  UISearchBar+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit


public extension UISearchBar {
    
    ///  Text field inside search bar (if applicable).
    public var m_textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    

    
}
#endif
