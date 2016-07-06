//
//  SwiftManTestsUIDevice+Man.swift
//  SwiftMan
//
//  Created by neu on 16/5/3.
//  Copyright © 2016年 cactus. All rights reserved.
//

import XCTest

class SwiftManTestsUIDevice_Man: XCTestCase {
    func testPrintSomeAttributes() {
   
        print("start--------")
        print(UIDevice.m_systemName)
        print(UIDevice.m_systemVersion)
        print(UIDevice.m_systemFloatVersion)
        print(UIDevice.m_deviceName)
        print(UIDevice.m_deviceLanguage)
        print("end--------")
        
        
        
    }
}
