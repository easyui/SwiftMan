//
//  UICollectionView+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/12.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UICollectionView {
    
    public func m_reloadData(_ completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    public func m_safeScrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
         guard m_isValidIndexPath(indexPath) else {
                 return
         }
         scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
     }
    
    public func m_isValidIndexPath(_ indexPath: IndexPath) -> Bool {
         return indexPath.section >= 0 &&
             indexPath.item >= 0 &&
             indexPath.section < numberOfSections &&
             indexPath.item < numberOfItems(inSection: indexPath.section)
     }
}


extension UICollectionView {
    
    public func m_indexPathForLastItem(inSection section: Int) -> IndexPath? {
        guard section >= 0 else {
            return nil
        }
        guard section < numberOfSections else {
            return nil
        }
        let numberOfRows = numberOfItems(inSection: section)
        guard numberOfRows > 0 else {
            return IndexPath(item: 0, section: section)
        }
        return IndexPath(item: numberOfRows - 1, section: section)
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
