//
//  UITableView+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit


extension UITableView{
    public func m_indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard section >= 0 else {
            return nil
        }
        guard numberOfRows(inSection: section) > 0  else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
    }
    
    public var m_indexPathForLastRow: IndexPath? {
        return m_indexPathForLastRow(inSection: m_lastSection)
    }
    
    /// SwiftMan: Index of last section in tableView.
    public var m_lastSection: Int {
        return numberOfSections > 0 ? numberOfSections - 1 : 0
    }
    
    /// SwiftMan: Number of all rows in all sections of tableView.
    public var m_numberOfRows: Int {
        var section = 0
        var rowCount = 0
        while section < numberOfSections {
            rowCount += numberOfRows(inSection: section)
            section += 1
        }
        return rowCount
    }
    
    public func m_reloadData(_ completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { finished in
            completion?(finished)
        })
    }
    
    public func m_removeTableFooterView() {
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    public func m_removeTableHeaderView() {
        tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    public func m_scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    public func m_scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
    
    public func m_isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section >= 0 &&
            indexPath.row >= 0 &&
            indexPath.section < numberOfSections &&
            indexPath.row < numberOfRows(inSection: indexPath.section)
    }
    
    public func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard m_isValidIndexPath(indexPath) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
}
#endif

