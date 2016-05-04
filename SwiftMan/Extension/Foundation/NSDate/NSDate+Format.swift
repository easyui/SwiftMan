//
//  NSDate+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

public extension NSDate {
    public func m_toDateStringWithDateFormat(formatString: String,timezoneAbbr: String,localeIdentifier:String) -> String{
        return m_toDasteStringWithDateFormat(formatString, timezone: NSTimeZone(abbreviation: timezoneAbbr)!, localeIdentifier: localeIdentifier)
    }
    
    public func m_toDasteStringWithDateFormat(formatString: String,timezone: NSTimeZone,localeIdentifier:String) -> String{
        let dataFormat = NSDateFormatter()
        dataFormat.locale = NSLocale(localeIdentifier: localeIdentifier)
        dataFormat.timeZone = timezone
        dataFormat.dateFormat = formatString
        return dataFormat.stringFromDate(self)
    }
    
}