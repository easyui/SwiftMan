//
//  UIApplication+Man.swift
//  SwiftMan
//
//  Created by neu on 16/4/29.
//  Copyright © 2016年 cactus. All rights reserved.
//
import UIKit


extension UIApplication{

    public var m_applicationFileSize: String {
        func sizeOfFolderPath(folderPath: String) -> Int64 {
            let contents: [String]?
            do {
                contents = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(folderPath)
            } catch _ {
                contents = nil
            }
            var folderSize: Int64 = 0
            
            if let tempContents = contents{
                for file in tempContents {
                    let dict = try?  NSFileManager.defaultManager().attributesOfItemAtPath((folderPath as NSString).stringByAppendingPathComponent(file))
                    if dict != nil {
                        folderSize += (dict![NSFileSize] as? Int64) ?? 0
                    }
                }
            }
            return folderSize
        }
        
        let docSize = sizeOfFolderPath(self.m_documentPath)
        let libSzie = sizeOfFolderPath(self.m_libraryPath)
        let cacheSize = sizeOfFolderPath(self.m_cachePath)
        let total = docSize + libSzie + cacheSize + cacheSize
        let folderSizeStr = NSByteCountFormatter.stringFromByteCount(total, countStyle: .File)
        
        return folderSizeStr
    }
    
    public var m_documentPath: String {
        let dstPath =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        return dstPath
    }
    
    
    public var m_libraryPath: String {
        let dstPath =  NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first!
        return dstPath
    }
    
    
    public var m_cachePath: String {
        let dstPath =  NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        return dstPath
    }
    
}


/*
 - (NSString *)ez_applicationFileSize{
 unsigned long long docSize   =  [self __ez_sizeOfFolder:[self __ez_documentPath]];
 unsigned long long libSize   =  [self __ez_sizeOfFolder:[self __ez_libraryPath]];
 unsigned long long cacheSize =  [self __ez_sizeOfFolder:[self __ez_cachePath]];
 
 unsigned long long total = docSize + libSize + cacheSize;
 
 NSString *folderSizeStr = [NSByteCountFormatter stringFromByteCount:total countStyle:NSByteCountFormatterCountStyleFile];
 return folderSizeStr;
 }
 
 
 
 
 
 -(unsigned long long)__ez_sizeOfFolder:(NSString *)folderPath
 {
 NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
 NSEnumerator *contentsEnumurator = [contents objectEnumerator];
 
 NSString *file;
 unsigned long long folderSize = 0;
 
 while (file = [contentsEnumurator nextObject]) {
 NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:file] error:nil];
 folderSize += [[fileAttributes objectForKey:NSFileSize] intValue];
 }
 return folderSize;
 }
 */