//
//  UINavigationController+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/1.
//  Copyright © 2016年 yangjun. All rights reserved.
//



public extension UINavigationController {
    
    private func doInTransaction(_ block: ()->(), completion:  (()->Void)? = nil)
    {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        block()
        CATransaction.commit()
    }
    
    public func m_popViewController(completion: (()->Void)? = nil)
    {
        self.doInTransaction({ popViewController(animated: true) }, completion: completion)
    }
    
    public func m_pushViewController(viewController: UIViewController, completion: (()->Void)? = nil)
    {
        self.doInTransaction({pushViewController(viewController, animated: true)}, completion: completion)
    }
    
}
