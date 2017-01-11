//
//  NSTimer+Addition.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation

extension Timer {
    
    public func m_pauseTimer(){
        guard self.isValid  else{
            return
        }
        self.fireDate = Date.distantFuture
    }
    
    public func m_resumeTimer(){
        guard self.isValid  else{
            return
        }
        self.fireDate = Date()
    }
    
    //延迟开始NSTimer
    public func m_resumeTimerAfterTimeInterval(_ seconds: TimeInterval){
        guard self.isValid  else{
            return
        }
        self.fireDate = Date(timeIntervalSinceNow: seconds)
    }
}
