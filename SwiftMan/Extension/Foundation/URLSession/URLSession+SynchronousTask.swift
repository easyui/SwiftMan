//
//  URLSession+SynchronousTask.swift
//  SwiftMan
//
//  Created by yangjun zhu on 2017/1/13.
//  Copyright © 2017年 cactus. All rights reserved.
//

import Foundation


public extension URLSession{
    
    // MARK: - send data

    public func m_sendSynchronousDataTask(with url: URL) -> (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) {
        return self.m_sendSynchronousDataTask(with: URLRequest(url: url))
    }

    public func m_sendSynchronousDataTask(with request: URLRequest) -> (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) {
        let semaphore = DispatchSemaphore(value: 0)
        var currentReturn: (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) = (nil,nil,nil)
        self.dataTask(with: request) { (_ taskData: Data?, _ taskResponse: URLResponse?, _ taskError: Error?) in
            currentReturn.taskData = taskData
            currentReturn.taskResponse = taskResponse
            currentReturn.taskError = taskError
            semaphore.signal()
        }.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        return currentReturn
    }
    
    // MARK: - download data

    public func m_sendSynchronousDownloadTaskWithURL(with url: URL) -> (taskLocation: URL?,  taskResponse: URLResponse?,  taskError: Error?) {
        return self.m_sendSynchronousDownloadTaskWithRequest(with: URLRequest(url: url))
    }
    
    public func m_sendSynchronousDownloadTaskWithRequest(with request: URLRequest) -> (taskLocation: URL?,  taskResponse: URLResponse?,  taskError: Error?) {
        let semaphore = DispatchSemaphore(value: 0)
        var currentReturn: (taskLocation: URL?,  taskResponse: URLResponse?,  taskError: Error?) = (nil,nil,nil)
        self.downloadTask(with: request) { (taskLocation: URL?,  taskResponse: URLResponse?,  taskError: Error?) in
            currentReturn.taskLocation = taskLocation
            currentReturn.taskResponse = taskResponse
            currentReturn.taskError = taskError
            semaphore.signal()
        }
        _ = semaphore.wait(timeout: .distantFuture)
        return currentReturn
    }
    
    // MARK: - update data
    
    public func m_sendSynchronousUploadTaskWithRequest(with request: URLRequest, fromFile fileURL: URL) -> (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) {
       return self.m_sendSynchronousUploadTaskWithRequest(with: request, fromData: try? Data(contentsOf: fileURL))
    }
    
    public func m_sendSynchronousUploadTaskWithRequest(with request: URLRequest, fromData bodyData: Data?) -> (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) {
        let semaphore = DispatchSemaphore(value: 0)
        var currentReturn: (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) = (nil,nil,nil)
        self.uploadTask(with: request, from: bodyData) { (taskData: Data?,  taskResponse: URLResponse?,  taskError: Error?) in
            currentReturn.taskData = taskData
            currentReturn.taskResponse = taskResponse
            currentReturn.taskError = taskError
            semaphore.signal()
        }.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        return currentReturn
    }
    
}
