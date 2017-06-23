//
//  UITableView+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/11.
//  Copyright © 2017年 cactus. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit


public extension UITableView{
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
    
    /// SwifterSwift: Index of last section in tableView.
    public var m_lastSection: Int {
        return numberOfSections > 0 ? numberOfSections - 1 : 0
    }
    
    /// SwifterSwift: Number of all rows in all sections of tableView.
    public var m_numberOfRows: Int {
        var section = 0
        var rowCount = 0
        while section < numberOfSections {
            rowCount += numberOfRows(inSection: section)
            section += 1
        }
        return rowCount
    }
    
   public func m_reloadData(_ completion:  (()->Void)? = nil) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion?()
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
}
#endif

