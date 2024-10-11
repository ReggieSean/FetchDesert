//
//  File.swift
//  
//
//  Created by SeanHuang on 10/8/24.
//

import Foundation

//a protocol for  service layer class types to init service whenever
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
    var session: URLSession?
    public init(){}
    
    public func reteriveAllDessert() async -> [MealModel]?{
        do{
            
            let ml : MealResponse =  try await APIManager.downloadDecodable(url:  APIManager.allMealAPI(catagory: "Dessert")!, session: session ?? URLSession.shared)
            return ml.meals
        } catch let Error{
            print(Error)
        }
        return nil
    }
    
    public func reteriveDessert(id : Int) async -> DetailMealModel?{
        
        do{
            let dml : DetailMealResponse =  try await APIManager.downloadDecodable(url:  APIManager.mealPrep(mealID: id)!, session: session ?? URLSession.shared)
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


class DessertAPIMockSerivce: DessertAPIService{
    var session: URLSession?
    
    init(){}
    
    
}

class DessertAPICombineService : DessertAPIService{
    var session: URLSession?
    
    init(){}
    
    func addSubscriber(){
        
    }
    
}
