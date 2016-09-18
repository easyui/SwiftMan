//
//  NSTimer+Block.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension Timer {
    public class func m_scheduledTimerWithTimeInterval(_ timeInterval: TimeInterval, block: ()->(),  repeats: Bool) -> Timer{
        return self.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(Timer.executeBlockWithTimer(_:)), userInfo: unsafeBitCast(block, to: AnyObject.self), repeats: repeats)
    }
    
    public class func m_timerWithTimeInterval(_ timeInterval: TimeInterval, block: ()->(),  repeats: Bool) -> Timer{
        return Timer(timeInterval: timeInterval, target: self, selector: #selector(Timer.executeBlockWithTimer(_:)), userInfo: unsafeBitCast(block, to: AnyObject.self), repeats: repeats)
    }
    
    @objc fileprivate class func executeBlockWithTimer(_ timer: Timer){
        let block: ()->() = unsafeBitCast(timer.userInfo, to: AnyObject.self) as! ()->();
        block()
    }
    
    public static func m_executeOnMainQueueAfterTimeInterval(_ seconds: TimeInterval,block: @escaping ()->()) {
        
        m_executeAfterTimeInterval(seconds, queue: DispatchQueue.main, block: block)
    }
    
    public static func m_executeAfterTimeInterval(_ seconds: TimeInterval, queue: DispatchQueue, block: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: block)
    }
}
