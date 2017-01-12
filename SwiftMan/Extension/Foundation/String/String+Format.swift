//
//  String+Format.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import Foundation

public extension String {
    /*
     - (NSString *)  ez_dateStringToDateStringWithDateFormat:(NSString *)formatString
     timezone                            :(NSString *)timezoneAbbr
     locale                              :(NSString *)localeIdentifier
     toDateFormat                        :(NSString *)toFormatString
     toTimezone                          :(NSString *)toTimezoneAbbr
     toLocale                            :(NSString *)toLocaleIdentifier
     {
     return [self ez_dateStringToDateStringWithDateFormat:formatString customTimezone:[NSTimeZone timeZoneWithAbbreviation:timezoneAbbr] locale:localeIdentifier toDateFormat:toFormatString toCustomTimezone:[NSTimeZone timeZoneWithAbbreviation:toTimezoneAbbr] toLocale:toLocaleIdentifier];
     }
     
     - (NSString *)  ez_dateStringToDateStringWithDateFormat:(NSString *)formatString
     customTimezone                      :(NSTimeZone *)timezone
     locale                              :(NSString *)localeIdentifier
     toDateFormat                        :(NSString *)toFormatString
     toCustomTimezone                    :(NSTimeZone *)toTimezone
     toLocale                            :(NSString *)toLocaleIdentifier
     {
     NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
     
     [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:localeIdentifier]];
     [dateFormat setTimeZone:timezone];
     
     [dateFormat setDateFormat:formatString];
     NSDate *date = [dateFormat dateFromString:self];
     
     [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:toLocaleIdentifier]];
     [dateFormat setTimeZone:toTimezone];
     
     [dateFormat setDateFormat:toFormatString];
     return [dateFormat stringFromDate:date];
     }
     */
    
    /// 格式化字符串时间
    ///
    /// - Parameters:
    ///   - formatString: 格式符
    ///   - timezoneAbbr: The abbreviation for the time zone.
    ///   - localeIdentifier: the specified identifier.
    ///   - toDateFormat: 格式符
    ///   - toTimezoneAbbr: The abbreviation for the time zone.
    ///   - toLocaleIdentifier: the specified identifier.
    /// - Returns: 格式化字符串时间
    public func m_toDasteStringWithDateFormat(_ formatString: String,timezoneAbbr: String,localeIdentifier:String,toDateFormat:String,toTimezoneAbbr:String,toLocaleIdentifier:String) -> String?{
        return m_toDasteStringWithDateFormat(formatString, timezone:  TimeZone(abbreviation: timezoneAbbr)!, localeIdentifier: localeIdentifier, toDateFormat: toDateFormat, toTimezone:  TimeZone(abbreviation: toTimezoneAbbr)!, toLocaleIdentifier: toLocaleIdentifier)
    }
    
    
    /// 格式化字符串时间
    ///
    /// - Parameters:
    ///   - formatString: 格式符
    ///   - timezone: 时区
    ///   - localeIdentifier: the specified identifier.
    ///   - toDateFormat: 格式符
    ///   - toTimezone: 时区
    ///   - toLocaleIdentifier: the specified identifier.
    /// - Returns: 格式化字符串时间
    public func m_toDasteStringWithDateFormat(_ formatString: String,timezone: TimeZone,localeIdentifier:String,toDateFormat:String,toTimezone:TimeZone,toLocaleIdentifier:String) -> String?{
        let dataFormat = DateFormatter()
        dataFormat.locale = Locale(identifier: localeIdentifier)
        dataFormat.timeZone = timezone
        dataFormat.dateFormat = formatString
        
        let date = dataFormat.date(from: self)
        dataFormat.locale = Locale(identifier: toLocaleIdentifier)
        dataFormat.timeZone = toTimezone
        dataFormat.dateFormat = toDateFormat
        if date != nil{
            return dataFormat.string(from: date!)
        }
        return nil
    }
    
}
