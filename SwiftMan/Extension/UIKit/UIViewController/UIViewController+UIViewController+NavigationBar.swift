//
//  UIViewController+UIViewController+NavigationBar.swift
//  SwiftMan
//
//  Created by neu on 16/7/18.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit


extension UIViewController{
    private struct AssociatedKeys {
        static var SwitchEffectKey = "SwitchEffectKey"
        static var LeftActionBlockKey = "LeftActionBlockKey"
        static var RightActionBlockKey = "RightActionBlockKey"
    }
    
    public enum NavigationBarButtonAsPosition : String {
        case NavigationBarButtonAsLeft = "leftBarButtonAction:"
        case  NavigationBarButtonAsRight = "rightBarButtonAction:"
    }
    public typealias ActionBlock = @convention(block) (barButton: UIButton?) -> Void
    
    public  func m_setNavigationBarButtonPosition(position: NavigationBarButtonAsPosition,
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
        
        let barButton = UIButton(type: .Custom)
        barButton.frame = CGRectMake(0, 0, 45, 40)
        barButton.backgroundColor = UIColor.clearColor()

//        barButton.addTarget(self, action: Selector(position.rawValue), forControlEvents: .TouchUpInside)
        barButton.addTarget(self, action: (position == .NavigationBarButtonAsLeft) ? #selector(UIViewController.leftBarButtonAction(_:)) : #selector(UIViewController.rightBarButtonAction(_:)), forControlEvents: .TouchUpInside)
        barButton.imageView?.contentMode = .ScaleAspectFit
        if let image = normalImage{
            barButton.setImage(image, forState: .Normal)
        }
        if let image = highlightedImage{
            barButton.setImage(image, forState: .Highlighted)
        }
        
        if let image = normalBgImage{
            barButton.setBackgroundImage(image, forState: .Normal)
        }
        if let image = highlightedBgImage{
            barButton.setBackgroundImage(image, forState: .Highlighted)
        }
        
        if let titleTemp = title{
            barButton.setTitle(titleTemp, forState: .Normal)
        }
        if let font = titleFont{
            barButton.titleLabel?.font = font
        }
        if let color = normalColor{
            barButton.setTitleColor(color, forState: .Normal)
        }
        if let color = highlightedColor{
            barButton.setTitleColor(color, forState: .Highlighted)
        }
        
        if (switchEffect) {
            if let image = highlightedImage{
                barButton.setImage(image, forState: .Selected)
            }
            if let image = highlightedBgImage{
                barButton.setBackgroundImage(image, forState: .Selected)
            }
            if let color = highlightedColor{
                barButton.setTitleColor(color, forState: .Selected)
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
            blockTemp(barButton: barButton);
        }
        if (switchEffect) {
            objc_setAssociatedObject(self, &AssociatedKeys.SwitchEffectKey, true, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        
        //http://www.hmttommy.com/2015/12/11/AddCategoryProperty/
        if let block = actionBlock{
            let wrapper = unsafeBitCast(block, AnyObject.self)
            if position == .NavigationBarButtonAsLeft{
                objc_setAssociatedObject(self,&AssociatedKeys.LeftActionBlockKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }else{
                objc_setAssociatedObject(self,&AssociatedKeys.RightActionBlockKey, wrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            
        }
        
        
    }
    
    @objc private func leftBarButtonAction(sender: UIButton?)
    {
        
        let switchEffect = objc_getAssociatedObject(self, &AssociatedKeys.SwitchEffectKey) as? Bool
        if let _ = switchEffect {
            if let button = sender{
                button.selected = !button.selected
            }
        }
        
        let wrapper = objc_getAssociatedObject(self, &AssociatedKeys.LeftActionBlockKey)
        if wrapper == nil{
            return
        }
        let block = unsafeBitCast(wrapper, ActionBlock.self)
        block(barButton: sender)
    }
    
    @objc private func rightBarButtonAction(sender: UIButton?)
    {
        
        let switchEffect = objc_getAssociatedObject(self, &AssociatedKeys.SwitchEffectKey) as? Bool
        if let _ = switchEffect {
            if let button = sender{
                button.selected = !button.selected
            }
        }
        let wrapper = objc_getAssociatedObject(self, &AssociatedKeys.RightActionBlockKey)
        if wrapper == nil{
            return
        }
        let block = unsafeBitCast(wrapper, ActionBlock.self)
        block(barButton: sender)
        
        
    }
    
}