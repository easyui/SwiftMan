//
//  UIImageView+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/12.
//  Copyright © 2017年 cactus. All rights reserved.
//

import Foundation


extension UIImageView {
    
    ///  Make image view blurry
    ///
    /// - Parameter withStyle: UIBlurEffectStyle (default is .light).
    func m_blur(withStyle: UIBlurEffectStyle = .light) {
        let blurEffect = UIBlurEffect(style: withStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
        self.clipsToBounds = true
    }
    
    
}
