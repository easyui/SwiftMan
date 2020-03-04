//
//  AVPlayerItem+Man.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2016/12/28.
//  Copyright © 2016年 yangjun zhu. All rights reserved.
//

#if canImport(AVFoundation)
import AVFoundation

extension AVPlayerItem {

    public var m_bufferDuration: TimeInterval? {
        if  let first = self.loadedTimeRanges.first {
            let timeRange = first.timeRangeValue
            let startSeconds = CMTimeGetSeconds(timeRange.start)
            let durationSecound = CMTimeGetSeconds(timeRange.duration)
            let result = startSeconds + durationSecound
            return result
        }
        return nil
    }

    
    /// 获取／设置当前subtitle／cc
    public var m_selectedMediaCharacteristicLegibleOption:AVMediaSelectionOption?{
        get{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.legible){
                return self.selectedMediaOption(in: legibleGroup)
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.legible){
                self.select(newValue, in: legibleGroup)
            }
        }
    }

    /// 获取／设置当前cc
    public var m_selectedClosedCaptionOption:AVMediaSelectionOption?{
        get{
            if let option = self.m_selectedMediaCharacteristicLegibleOption{
                if option.mediaType.rawValue == "clcp" {
                    return option
                }
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.legible){
                if newValue == nil{
                    self.select(newValue, in: legibleGroup)
                }else if newValue!.mediaType.rawValue == "clcp"{
                    self.select(newValue, in: legibleGroup)
                }
            }
        }
    }

    /// 获取／设置当前subtitle
    public var m_selectedSubtitleOption:AVMediaSelectionOption?{
        get{
            if let option = self.m_selectedMediaCharacteristicLegibleOption{
                if !option.hasMediaCharacteristic(AVMediaCharacteristic.containsOnlyForcedSubtitles) {
                    return option
                }
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.legible){
                if newValue == nil{
                    self.select(newValue, in: legibleGroup)
                }else if !newValue!.hasMediaCharacteristic(AVMediaCharacteristic.containsOnlyForcedSubtitles) {
                    self.select(newValue, in: legibleGroup)
                }
            }
        }
    }

    /// 获取／设置当前audio
    public var m_selectedMediaCharacteristicAudibleOption:AVMediaSelectionOption?{
        get{
            if let group = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.audible){
                return self.selectedMediaOption(in: group)
            }
            return nil
        }
        set{
            if let group = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristic.audible){
                self.select(newValue, in: group)
            }
        }
    }

}

#endif
