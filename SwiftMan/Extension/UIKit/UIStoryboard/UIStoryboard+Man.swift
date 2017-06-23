//
//  UIStoryboard+Man.swift
//  SwiftMan
//
//  Created by yangjun on 2017/6/21.
//  Copyright © 2017年 cactus. All rights reserved.
//


#if os(iOS) || os(tvOS)
    import UIKit
    
    // MARK: - Methods
    public extension UIStoryboard {
        
        /// SwiftMan: Get main storyboard for application
        public static var mainStoryboard: UIStoryboard? {
            let bundle = Bundle.main
            guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
            return UIStoryboard(name: name, bundle: bundle)
        }
    }
#endif
