//
//  SwiftMan.h
//  SwiftMan
//
//  Created by yangjun on 16/4/29.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#import "TargetConditionals.h"


#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#elif TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#endif

//! Project version number for SwiftMan.
FOUNDATION_EXPORT double SwiftManVersionNumber;

//! Project version string for SwiftMan.
FOUNDATION_EXPORT const unsigned char SwiftManVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SwiftMan/PublicHeader.h>


