//
//  File.swift
//  
//
//  Created by SeanHuang on 10/10/24.
//

import Foundation

class MockURLProtocol: URLProtocol{
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
        
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        // Here you can decide which requests to mock and which to pass through
        if request.url?.host == "example.com" {
            // Mock requests to "example.com"
            return true
        }
        return false
    }
        
        // Override the required methods (startLoading, stopLoading, etc.)
        
    override func startLoading() {
    }
        
    override func stopLoading() {
    }
}

