//
//  UICollectionView+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/12.
//  Copyright © 2017年 cactus. All rights reserved.
//

import Foundation

public extension UICollectionView {
    
    public func m_reloadData(_ completion:  (()->Void)? = nil) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion?()
        })
    }
}
