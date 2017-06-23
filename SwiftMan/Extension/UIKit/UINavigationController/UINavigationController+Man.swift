//
//  UINavigationController+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/1.
//  Copyright © 2016年 yangjun. All rights reserved.
//


#if os(iOS) || os(tvOS)
import UIKit
    
public extension UINavigationController {
    
    private func m_doInTransaction(_ block: ()->(), completion:  (()->Void)? = nil)
    {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        block()
        CATransaction.commit()
    }
    
    public func m_popViewController(completion: (()->Void)? = nil)
    {
        self.m_doInTransaction({ popViewController(animated: true) }, completion: completion)
    }
    
    public func m_pushViewController(viewController: UIViewController, completion: (()->Void)? = nil)
    {
        self.m_doInTransaction({pushViewController(viewController, animated: true)}, completion: completion)
    }
    
}
#endif
