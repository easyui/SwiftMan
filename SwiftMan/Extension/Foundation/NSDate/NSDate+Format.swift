//
//  NSDate+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/4.
//  Copyright © 2016年 cactus. All rights reserved.
//

import Foundation

public extension Date {
    public func m_toDateStringWithDateFormat(_ formatString: String,timezoneAbbr: String,localeIdentifier:String) -> String{
        return m_toDasteStringWithDateFormat(formatString, timezone: TimeZone(abbreviation: timezoneAbbr)!, localeIdentifier: localeIdentifier)
    }
    
    public func m_toDasteStringWithDateFormat(_ formatString: String,timezone: TimeZone,localeIdentifier:String) -> String{
        let dataFormat = DateFormatter()
        dataFormat.locale = Locale(identifier: localeIdentifier)
        dataFormat.timeZone = timezone
        dataFormat.dateFormat = formatString
        return dataFormat.string(from: self)
    }
    
}
