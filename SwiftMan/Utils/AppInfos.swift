//
//  AppInfos.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

import UIKit
import CoreTelephony

public struct AppInfos {
    ///  app's name
    public static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }
        
        return nil
    }
    
    public static var identifier: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }


    
    /// Info.plist 格式的版本信息
    public static var targetedVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleInfoDictionaryVersion") as? String
    }
    
    
    /// 发布版本号(app's version number)
    public static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /// 内部版本号(app's build number)
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    
    /// 系统版本号(ex 10.0.2)
    public static var osVersion: String? {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
    }
    
    
    /// 系统名字
    public static var osName: String? {
            #if os(iOS)
                return "iOS"
            #elseif os(watchOS)
                return "watchOS"
            #elseif os(tvOS)
                return "tvOS"
            #elseif os(macOS)
                return "OS X"
            #elseif os(Linux)
                return "Linux"
            #else
                return "Unknown"
            #endif
    }
    
    
    /// 运营商名字
    public static var carrierName: String? {
        let netinfo = CTTelephonyNetworkInfo()
        let carrier = netinfo.subscriberCellularProvider
        return carrier?.carrierName
    }

    
    // Return device version ""
    public static var deviceVersion: String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }
    

    public static var isDebug: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }
    

    public static var isRelease: Bool {
       return !isDebug
    }
    

    /// 是模拟器
    public static var isSimulator: Bool {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            return true
        #else
            return false
        #endif
    }
    
    /// 是设备
    public static var isDevice: Bool {
        return !isSimulator
    }

    
    public static func appURLStringWithAppID(_ appID: String) -> String{
        return "itms-apps://itunes.apple.com/cn/app/id\(appID)"
    }
    
    /*
     可以获取appstore版本，支持设备，appURLStringWithAppID等
     return demo data:
     {
     "resultCount": 1,
     "results": [
     {
     "screenshotUrls": [
     "http://a4.mzstatic.com/us/r30/Purple5/v4/fa/36/e5/fa36e5e0-7bfa-4322-bbee-bc49d5a0e776/screen320x320.jpeg",
     "http://a5.mzstatic.com/us/r30/Purple5/v4/08/18/08/081808c3-fccf-bd43-c268-374f0e7e7758/screen320x320.jpeg",
     "http://a4.mzstatic.com/us/r30/Purple5/v4/22/98/74/22987487-3d51-3bfc-76c8-f1a5931debf8/screen320x320.jpeg",
     "http://a3.mzstatic.com/us/r30/Purple1/v4/a6/ce/8d/a6ce8d12-7816-490c-060d-d4ad9685135e/screen320x320.jpeg",
     "http://a4.mzstatic.com/us/r30/Purple7/v4/da/ed/45/daed4570-28d7-0955-d7f1-fc089fd0ff17/screen320x320.jpeg"
     ],
     "ipadScreenshotUrls": [
     "http://a4.mzstatic.com/us/r30/Purple1/v4/98/97/03/9897030c-2d64-5f0a-b9fd-19ba9dfe4396/screen480x480.jpeg",
     "http://a2.mzstatic.com/us/r30/Purple7/v4/da/b7/4d/dab74dab-7d9e-d321-b5bb-1456c4bc9000/screen480x480.jpeg",
     "http://a2.mzstatic.com/us/r30/Purple7/v4/a5/31/5a/a5315ab5-9294-e6ec-a662-921bfc7cbac8/screen480x480.jpeg",
     "http://a5.mzstatic.com/us/r30/Purple5/v4/5e/27/4c/5e274c83-38ba-7fdd-11dd-4aed574d55c5/screen480x480.jpeg",
     "http://a1.mzstatic.com/us/r30/Purple7/v4/7c/d8/36/7cd836c7-c414-f02d-d42b-8d1d8ab9d90d/screen480x480.jpeg"
     ],
     "artworkUrl60": "http://is4.mzstatic.com/image/thumb/Purple49/v4/eb/11/4c/eb114cb0-f215-371a-0182-fffc1108764d/source/60x60bb.jpg",
     "artworkUrl512": "http://is4.mzstatic.com/image/thumb/Purple49/v4/eb/11/4c/eb114cb0-f215-371a-0182-fffc1108764d/source/512x512bb.jpg",
     "artworkUrl100": "http://is4.mzstatic.com/image/thumb/Purple49/v4/eb/11/4c/eb114cb0-f215-371a-0182-fffc1108764d/source/100x100bb.jpg",
     "artistViewUrl": "https://itunes.apple.com/us/developer/urbn-pockets/id422263705?uo=4",
     "isGameCenterEnabled": false,
     "kind": "software",
     "supportedDevices": [
     "iPad2Wifi",
     "iPad23G",
     "iPhone4S",
     "iPadThirdGen",
     "iPadThirdGen4G",
     "iPhone5",
     "iPodTouchFifthGen",
     "iPadFourthGen",
     "iPadFourthGen4G",
     "iPadMini",
     "iPadMini4G",
     "iPhone5c",
     "iPhone5s",
     "iPhone6",
     "iPhone6Plus",
     "iPodTouchSixthGen"
     ],
     "features": [
     "iosUniversal"
     ],
     "advisories": [],
     "trackCensoredName": "This is my Food - Nutrition for Kids",
     "languageCodesISO2A": [
     "EN",
     "FR",
     "DE",
     "IT",
     "JA",
     "KO",
     "RU",
     "ZH",
     "ES",
     "SV"
     ],
     "fileSizeBytes": "190521059",
     "sellerUrl": "http://urbnpockets.com/apps/this-is-my-food-nutrition-for-kids/show",
     "trackViewUrl": "https://itunes.apple.com/us/app/this-is-my-food-nutrition/id987953868?mt=8&uo=4",
     "trackContentRating": "4+",
     "contentAdvisoryRating": "4+",
     "minimumOsVersion": "8.0",
     "currency": "USD",
     "wrapperType": "software",
     "version": "1.1.1",
     "artistId": 422263705,
     "artistName": "urbn; pockets",
     "genres": [
     "Education",
     "Food & Drink"
     ],
     "price": 2.99,
     "description": "Explore the world of food and nutrition and bring your favorite dish on the table!\nGain clever knowledge and learn interesting facts about food classifications, nutrition and how to cultivate herbs in a fun way!\n\nIn a lighthearted way children become experts in food and nutrition.\n\nDISCOVER: Get to know various groceries and gain information about nutrition, digestion and interesting facts about diets and different eating behaviours – appropriate for children.\n\nEXPERIMENT: Plant your own herbs and document the process within the app with our special photo and audio feature. \n\nDeveloped by a team of experts, parents and children – for curious boys and girls!\n\nThis app is found on the initial STEM (Science, Technology, Engineering and Mathematics) foundation and provides standard-based structured inquiry-based and real world problem-based learning, connecting parts from all four of the STEM subjects. There is also an emphasis placed on bridging in-school and out-of-school STEM learning opportunities.\n\n„My Food“ aligns with the classroom programs and nutrition plans from the Diary Council of California and the USDA Food Guidance System, as well as the EUFIC (European Food Information Council) guide for a healthy lifestyle.\nIt has been designed to fulfill the California’s Common Core Content Standards Chart and the National Education Standards.\n\nContent: \n- What is your favourite food? \n- How to cultivate your own garden?\n- Where does it grow?\n- Is it vegetable or fruit?\n- How does it taste?\nLearn within the app – use in real life!\n\nFeatures:\n- Original artwork and illustrations!\n- Intuitive and child-friendly design!\n- No reading required!\n- Voice over read by children!\n- Additional texts available for \"little smarty-pants\"!\n- Intuitive, safe, and kid-friendly interface! \n- Fun for all ages, from toddlers to adults! \n- No rules or levels, curiosity is rewarded! \n- Contains no in-app purchases or advertisements from third party companies!\nTry it out yourself!\n\nThis is my Food - Nutrition for Kids follows a playful and educational method that entertains children while learning.\n\nWe love to hear from you! Reach out: info@urbn-pockets.com",
     "bundleId": "com.urbn-pockets.thisismyfood",
     "trackName": "This is my Food - Nutrition for Kids",
     "trackId": 987953868,
     "releaseDate": "2015-07-15T07:00:00Z",
     "primaryGenreName": "Education",
     "isVppDeviceBasedLicensingEnabled": true,
     "formattedPrice": "$2.99",
     "currentVersionReleaseDate": "2016-03-10T20:07:58Z",
     "releaseNotes": "Updated version! Want more infos on updates or promotions? Just like us: http://fb.com/urbnpockets",
     "sellerName": "urbn; pockets",
     "primaryGenreId": 6017,
     "genreIds": [
     "6017",
     "6023"
     ],
     "averageUserRating": 4,
     "userRatingCount": 10
     }
     ]
     }
     */
    public static func appInfoURLStringWithAppID(_ appID: String) -> String{
        return "http://itunes.apple.com/lookup?id=\(appID)"
    }


}
