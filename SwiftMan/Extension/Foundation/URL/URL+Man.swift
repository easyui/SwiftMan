//
//  NSURL+Man.swift
//  SwiftMan
//
//  Created by yangjun on 16/5/4.
//  Copyright © 2016年 yangjun. All rights reserved.
//

#if canImport(Foundation)
import Foundation

//#if canImport(UIKit) && canImport(AVFoundation)
//import UIKit
//import AVFoundation
//#endif

extension URL {
    
    
    public var m_queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }
        
        return parameters
    }
    
    /// SwifterMan: URL with appending query parameters.
    ///
    ///        let url = URL(string: "https://google.com")!
    ///        let param = ["q": "Swifter Swift"]
    ///        url.appendingQueryParameters(params) -> "https://google.com?q=Swifter%20Swift"
    ///
    /// - Parameter parameters: parameters dictionary.
    /// - Returns: URL with appending given query parameters.
    func appendingQueryParameters(_ parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        var items = urlComponents.queryItems ?? []
        items += parameters.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = items
        return urlComponents.url!
    }

    /// SwifterMan: Append query parameters to URL.
    ///
    ///        var url = URL(string: "https://google.com")!
    ///        let param = ["q": "Swifter Swift"]
    ///        url.appendQueryParameters(params)
    ///        print(url) // prints "https://google.com?q=Swifter%20Swift"
    ///
    /// - Parameter parameters: parameters dictionary.
    mutating func appendQueryParameters(_ parameters: [String: String]) {
        self = appendingQueryParameters(parameters)
    }

    /// SwifterMan: Get value of a query key.
    ///
    ///    var url = URL(string: "https://google.com?code=12345")!
    ///    queryValue(for: "code") -> "12345"
    ///
    /// - Parameter key: The key of a query value.
    func queryValue(for key: String) -> String? {
        return URLComponents(string: absoluteString)?
            .queryItems?
            .first(where: { $0.name == key })?
            .value
    }
    
    /*
    #if os(iOS) || os(tvOS)
     /// SwifterMan: Generate a thumbnail image from given url. Returns nil if no thumbnail could be created. This function may take some time to complete. It's recommended to dispatch the call if the thumbnail is not generated from a local resource.
     ///
     ///     var url = URL(string: "https://video.golem.de/files/1/1/20637/wrkw0718-sd.mp4")!
     ///     var thumbnail = url.thumbnail()
     ///     thumbnail = url.thumbnail(fromTime: 5)
     ///
     ///     DisptachQueue.main.async {
     ///         someImageView.image = url.thumbnail()
     ///     }
     ///
     /// - Parameter time: Seconds into the video where the image should be generated.
     /// - Returns: The UIImage result of the AVAssetImageGenerator
     func thumbnail(fromTime time: Float64 = 0) -> UIImage? {
         let imageGenerator = AVAssetImageGenerator(asset: AVAsset(url: self))
         let time = CMTimeMakeWithSeconds(time, preferredTimescale: 1)
         var actualTime = CMTimeMake(value: 0, timescale: 0)

         guard let cgImage = try? imageGenerator.copyCGImage(at: time, actualTime: &actualTime) else {
             return nil
         }
         return UIImage(cgImage: cgImage)
     }
     #endif
     */
}

#endif
