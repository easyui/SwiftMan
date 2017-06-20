//
//  NSTimer+Block.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation

public extension Timer {
    
    public class func m_scheduledTimer(timeInterval: TimeInterval, block: ()->(),  repeats: Bool) -> Timer{
        return self.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(Timer.executeBlockWithTimer(_:)), userInfo: block, repeats: repeats)

    }
    
    public class func m_timer(timeInterval: TimeInterval, block: ()->(),  repeats: Bool) -> Timer{
        return Timer(timeInterval: timeInterval, target: self, selector: #selector(Timer.executeBlockWithTimer(_:)), userInfo: block, repeats: repeats)

    }
    
    public class func m_timerOnCurrentCommonModes(timeInterval: TimeInterval, block: ()->(),  repeats: Bool) -> Timer{
        let timer = Timer(timeInterval: timeInterval, target: self, selector: #selector(Timer.executeBlockWithTimer(_:)), userInfo: block, repeats: repeats)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
        return timer
    }
    
    @objc private class func executeBlockWithTimer(_ timer: Timer){
        let block: ()->() = timer.userInfo as! ()->();
        block()
    }
    
    public static func m_executeOnMainQueueAfter(seconds: TimeInterval,block: @escaping ()->()) {
        
        m_executeAfter(seconds: seconds, queue: DispatchQueue.main, block: block)
    }
    
    public static func m_executeAfter(seconds: TimeInterval, queue: DispatchQueue, block: @escaping ()->()) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: block)
    }

}
