//
//  NSTimer+Addition.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

extension NSTimer {
    
    public func m_pauseTimer(){
        guard self.valid  else{
            return
        }
        self.fireDate = NSDate.distantFuture()
    }
    
    public func m_resumeTimer(){
        guard self.valid  else{
            return
        }
        self.fireDate = NSDate()
    }
    
    //延迟开始NSTimer
    public func m_resumeTimerAfterTimeInterval(seconds: NSTimeInterval){
        guard self.valid  else{
            return
        }
        self.fireDate = NSDate(timeIntervalSinceNow: seconds)
    }
}