//
//  UICollectionView+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/12.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

    public extension UICollectionView {
    
    public func m_reloadData(_ completion:  (()->Void)? = nil) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion?()
        })
    }
}


public extension UICollectionView {
    
   	public func m_indexPathForLastItem(inSection section: Int) -> IndexPath? {
        guard section >= 0 else {
            return nil
        }
        guard section < numberOfSections else {
            return nil
        }
        guard numberOfItems(inSection: section) > 0 else {
            return IndexPath(item: 0, section: section)
        }
        return IndexPath(item: numberOfItems(inSection: section) - 1, section: section)
    }
    
    public var m_indexPathForLastItem: IndexPath? {
        return m_indexPathForLastItem(inSection: m_lastSection)
    }
    
    public var m_lastSection: Int {
        return numberOfSections > 0 ? numberOfSections - 1 : 0
    }
    
    public var m_numberOfItems: Int {
        var section = 0
        var itemsCount = 0
        while section < self.numberOfSections {
            itemsCount += numberOfItems(inSection: section)
            section += 1
        }
        return itemsCount
    }
}
#endif
