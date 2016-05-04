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
    
    public static func m_executeOnMainQueueAfterTimeInterval(seconds: NSTimeInterval,block: dispatch_block_t) {
        
        m_executeAfterTimeInterval(seconds, queue: dispatch_get_main_queue(), block: block)
    }
    
    public static func m_executeAfterTimeInterval(seconds: NSTimeInterval, queue: dispatch_queue_t, block: dispatch_block_t) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        dispatch_after(time, queue, block)
    }
}