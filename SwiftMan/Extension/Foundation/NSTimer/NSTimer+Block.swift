//
//  NSTimer+Block.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension NSTimer {
    public class func m_scheduledTimerWithTimeInterval(timeInterval: NSTimeInterval, block: dispatch_block_t,  repeats: Bool) -> NSTimer{
        return self.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: nil, userInfo: unsafeBitCast(block, AnyObject.self), repeats: repeats)
    }
    
    public class func m_timerWithTimeInterval(timeInterval: NSTimeInterval, block: dispatch_block_t,  repeats: Bool) -> NSTimer{
        return NSTimer(timeInterval: timeInterval, target: self, selector: nil, userInfo: unsafeBitCast(block, AnyObject.self), repeats: repeats)
    }
    
    private class func executeBlockWithTimer(timer: NSTimer){
        let block: dispatch_block_t = unsafeBitCast(timer.userInfo, dispatch_block_t.self) as dispatch_block_t;
        block()
    }
       
}