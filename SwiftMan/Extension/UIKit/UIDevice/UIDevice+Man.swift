//
//  UIDevice+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/2.
//  Copyright © 2016年 cactus. All rights reserved.
//

import UIKit

extension UIDevice {
    // Returns true if the device is iPhone
    public static var  m_isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  m_isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    //  Operating system name  e.g. iPhone OS
    public static var m_systemName: String {
        return UIDevice.current.systemName
    }
    
    //    e.g. iPhone1,1
    public static var m_deviceModel: String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }
    
    
    
    //   Operating system version e.g. 9.3
    public static var m_systemVersion: String {
        return UIDevice.current.systemVersion
    }
    
    //   Operating system version e.g. 9.3
    public static var m_systemFloatVersion: Float {
        return (UIDevice.m_systemVersion as NSString).floatValue
    }
    
    //    e.g. iPhone Simulator
    public static var m_deviceName: String {
        return UIDevice.current.name
    }
    
    //    e.g. en
    public static var m_deviceLanguage: String {
        return Bundle.main.preferredLocalizations[0]
    }
    
    //
    public static var m_compilationArchitecture: String {
        #if __LP64__
            return "64bits";
        #else
            return "32bits";
        #endif
    }
    
    
    public static var m_batteryLevel: Float {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return UIDevice.current.batteryLevel
    }
    
    
    public enum Version: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
    }
    
    public class func isVersion(_ version: Version) -> Bool {
        return UIDevice.m_systemFloatVersion >= version.rawValue && UIDevice.m_systemFloatVersion < (version.rawValue + 1.0)
    }
    
    public class func isVersionOrLater(_ version: Version) -> Bool {
        return UIDevice.m_systemFloatVersion >= version.rawValue
    }
    
    public class func isVersionOrEarlier(_ version: Version) -> Bool {
        return UIDevice.m_systemFloatVersion < (version.rawValue + 1.0)
    }
    
}
