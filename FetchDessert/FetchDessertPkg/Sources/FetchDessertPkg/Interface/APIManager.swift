//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

enum APIError : Error{
    case requestError(String)
    case responseCastError(String)
    case decodeError(String)
}



public class APIManager :ObservableObject{
   
    
    
    public static var shared = APIManager()
    
    public init(){}
    
    
    public func reteriveAllDesert() async -> [String]?{
        return nil
    }
}
