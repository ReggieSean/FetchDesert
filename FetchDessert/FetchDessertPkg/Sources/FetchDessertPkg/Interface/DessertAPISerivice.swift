//
//  File.swift
//  
//
//  Created by SeanHuang on 10/8/24.
//

import Foundation

//a protocol for class type service layer objects to init service whenever
protocol DessertAPIService : AnyObject{
    var session : URLSession? {get set}
}

//a default urlsession initializer when not mocking
extension DessertAPIService{
    func initService(configuration: URLSessionConfiguration = URLSessionConfiguration.default){
        session = URLSession(configuration: configuration)
    }
}

public class DessertAPIAsyncSerivice: DessertAPIService{
    var session: URLSession?;
    public init(){}
    
    public func reteriveAllDessert() async -> [MealModel]?{
        let session = URLSession.shared
        do{
            var ml : MealResponse =  try await APIManager.downloadDecodable(url:  APIManager.allMealAPI(catagory: "Dessert")!)
            return ml.meals
        } catch let Error{
            print(Error)
        }
        return nil
    }
    
    public func reteriveDesert(id : Int) async -> DetailMealModel?{
        let session = URLSession.shared
        
        do{
            var dml : DetailMealResponse =  try await APIManager.downloadDecodable(url:  APIManager.allMealAPI(catagory: "Dessert")!)
            return dml.meals[0]
        } catch let Error{
            #if DEBUG
            print(Error)
            print(Error.localizedDescription)
            #endif
        }
        return nil
    }
}

class DessertAPICombineService : DessertAPIService{
    var session: URLSession?
    
    init(){}
    
    func addSubscriber(){
        
    }
    
}
