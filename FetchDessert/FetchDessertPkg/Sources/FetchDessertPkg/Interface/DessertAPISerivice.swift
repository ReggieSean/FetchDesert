//
//  File.swift
//  
//
//  Created by SeanHuang on 10/8/24.
//

import Foundation

//a class for allowing a single type of viewmodel to accept a common
//type for multiple service types.
public class DessertAPIService{
    public init(){}
}




public class DessertAPIAsyncService: DessertAPIService{
    var session: URLSession?
    
    public func retreiveAllDessert() async -> [MealModel]?{
        do{
            
            let ml : MealResponse =  try await APIManager.downloadDecodable(url:  APIManager.allMealAPI(catagory: "Dessert")!, session: session ?? URLSession.shared)
            return ml.meals
        } catch let Error{
            print(Error)
        }
        return nil
    }
    
   
    
}


class DessertAPIMockSerivce: DessertAPIService{
    var session: URLSession?
    
    
}

class DessertAPICombineService : DessertAPIService{
    var session: URLSession?
    
    
    func addSubscriber(){
        
    }
    
}
