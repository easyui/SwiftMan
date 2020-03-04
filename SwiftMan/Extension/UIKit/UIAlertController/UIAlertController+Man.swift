//
//  UIAlertController+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/1.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIAlertController{
    public func m_show(animated: Bool = true, completion: (() -> Void)? = nil) {
        #if targetEnvironment(macCatalyst)
        let window = UIApplication.shared.windows.last
        #else
        let window = UIApplication.shared.keyWindow
        #endif
        window?.rootViewController?.present(self, animated: animated, completion: completion)
    }
    
    @discardableResult public func m_addAction(title: String, style: UIAlertAction.Style = .default, isEnabled: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        action.isEnabled = isEnabled
        self.addAction(action)
        return action
    }
    
    public func m_addTextField(text: String? = nil, placeholder: String? = nil, editingChangedTarget: Any?, editingChangedSelector: Selector?) {
        self.addTextField { tf in
            tf.text = text
            tf.placeholder = placeholder
            if let target = editingChangedTarget, let selector = editingChangedSelector {
                tf.addTarget(target, action: selector, for: .editingChanged)
            }
        }
    }

}

extension UIAlertController {
    public convenience init(title: String? = nil, message: String? = nil, defaultActionButtonTitle: String = "OK", tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        self.addAction(defaultAction)
        if let color = tintColor {
            self.view.tintColor = color
        }
    }
    

    public convenience init(title: String = "Error", error: Error, defaultActionButtonTitle: String = "OK", tintColor: UIColor? = nil) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        self.addAction(defaultAction)
        if let color = tintColor {
            self.view.tintColor = color
        }
    }
}
#endif
