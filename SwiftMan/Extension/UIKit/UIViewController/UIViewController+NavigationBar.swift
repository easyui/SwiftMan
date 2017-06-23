//
//  UIViewController+UIViewController+NavigationBar.swift
//  SwiftMan
//
//  Created by yangjun on 16/7/18.
//  Copyright © 2016年 yangjun. All rights reserved.
//
#if os(iOS) || os(tvOS)

import UIKit


public extension UIViewController{
    fileprivate struct AssociatedKeys {
        static var SwitchEffectKey = "SwitchEffectKey"
        static var LeftActionBlockKey = "LeftActionBlockKey"
        static var RightActionBlockKey = "RightActionBlockKey"
    }
    
    public enum NavigationBarButtonAsPosition : String {
        case NavigationBarButtonAsLeft = "leftBarButtonAction:"
        case  NavigationBarButtonAsRight = "rightBarButtonAction:"
    }
    public typealias ActionBlock = @convention(block) (_ barButton: UIButton?) -> Void
    
    public  func m_setNavigationBarButtonPosition(_ position: NavigationBarButtonAsPosition,
                                                   normalImage: UIImage?,
                                                   highlightedImage: UIImage?,
                                                   normalBgImage: UIImage?,
                                                   highlightedBgImage: UIImage?,
                                                   title: String?,
                                                   titleFont: UIFont?,
                                                   normalColor: UIColor?,
                                                   highlightedColor: UIColor?,
                                                   switchEffect:Bool,
                                                   actionBlock: ActionBlock?,
                                                   offset:CGFloat, //set -24 to system default, toolkit provide 24 as default offset
        setButtonBlock: ActionBlock? ){
        
        let barButton = UIButton(type: .custom)
        barButton.frame = CGRect(x: 0, y: 0, width: 45, height: 40)
        barButton.backgroundColor = UIColor.clear

//        barButton.addTarget(self, action: Selector(position.rawValue), forControlEvents: .TouchUpInside)
        barButton.addTarget(self, action: (position == .NavigationBarButtonAsLeft) ? #selector(UIViewController.leftBarButtonAction(_:)) : #selector(UIViewController.rightBarButtonAction(_:)), for: .touchUpInside)
        barButton.imageView?.contentMode = .scaleAspectFit
        if let image = normalImage{
            barButton.setImage(image, for: UIControlState())
        }
        if let image = highlightedImage{
            barButton.setImage(image, for: .highlighted)
        }
        
        if let image = normalBgImage{
            barButton.setBackgroundImage(image, for: UIControlState())
        }
        if let image = highlightedBgImage{
            barButton.setBackgroundImage(image, for: .highlighted)
        }
        
        if let titleTemp = title{
            barButton.setTitle(titleTemp, for: UIControlState())
        }
        if let font = titleFont{
            barButton.titleLabel?.font = font
        }
        if let color = normalColor{
            barButton.setTitleColor(color, for: UIControlState())
        }
        if let color = highlightedColor{
            barButton.setTitleColor(color, for: .highlighted)
        }
        
        if (switchEffect) {
            if let image = highlightedImage{
                barButton.setImage(image, for: .selected)
            }
            if let image = highlightedBgImage{
                barButton.setBackgroundImage(image, for: .selected)
            }
            if let color = highlightedColor{
                barButton.setTitleColor(color, for: .selected)
            }
        }
        
        let barButtonItem = UIBarButtonItem(customView: barButton)
        if position == .NavigationBarButtonAsLeft{
            self.navigationItem.leftBarButtonItem = barButtonItem;
        }else{
            self.navigationItem.rightBarButtonItem = barButtonItem;
        }
        barButton.imageEdgeInsets = UIEdgeInsetsMake(0, position == .NavigationBarButtonAsLeft ? -(24+offset):0, 0, position == .NavigationBarButtonAsLeft ? 0:-(24+offset));
        barButton.titleEdgeInsets = UIEdgeInsetsMake(0, position == .NavigationBarButtonAsLeft ? -(24+offset):0, 0, position == .NavigationBarButtonAsLeft ? 0:-(24+offset));
        if let blockTemp = setButtonBlock {
            blockTemp(barButton);
        }
        if (switchEffect) {
            objc_setAssociatedObject(self, &AssociatedKeys.SwitchEffectKey, true, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        
        //http://www.hmttommy.com/2015/12/11/AddCategoryProperty/
        if let block = actionBlock{
            let wrapper = unsafeBitCast(block, to: AnyObject.self)
            if position == .NavigationBarButtonAsLeft{
                objc_setAssociatedObject(self,&AssociatedKeys.LeftActionBlockKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }else{
                objc_setAssociatedObject(self,&AssociatedKeys.RightActionBlockKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            
        }
        
        
    }
    
    @objc fileprivate func leftBarButtonAction(_ sender: UIButton?)
    {
        
        let switchEffect = objc_getAssociatedObject(self, &AssociatedKeys.SwitchEffectKey) as? Bool
        if let _ = switchEffect {
            if let button = sender{
                button.isSelected = !button.isSelected
            }
        }
        
        let wrapper = objc_getAssociatedObject(self, &AssociatedKeys.LeftActionBlockKey)
        if wrapper == nil{
            return
        }
        let block = unsafeBitCast(wrapper, to: ActionBlock.self)
        block(sender)
    }
    
    @objc fileprivate func rightBarButtonAction(_ sender: UIButton?)
    {
        
        let switchEffect = objc_getAssociatedObject(self, &AssociatedKeys.SwitchEffectKey) as? Bool
        if let _ = switchEffect {
            if let button = sender{
                button.isSelected = !button.isSelected
            }
        }
        let wrapper = objc_getAssociatedObject(self, &AssociatedKeys.RightActionBlockKey)
        if wrapper == nil{
            return
        }
        let block = unsafeBitCast(wrapper, to: ActionBlock.self)
        block(sender)
        
        
    }
    
}
#endif
