//
//  File.swift
//  
//
//  Created by SeanHuang on 10/11/24.
//

import Foundation
import SwiftUI

public class DetailDessertAPISerivce{
    var session: URLSession?
    internal let simple :MealModel
    init(mealModel: MealModel) {
        self.simple = mealModel
    }
}

public class DetailDessertAsyncSerivice: DetailDessertAPISerivce{
    
    override public init(mealModel: MealModel){
        super.init(mealModel:mealModel)
        
        
    }
    public func reteriveDessert() async -> DetailMealModel?{
        let id = simple.id
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
   
    public func retreiveImage() async -> Image{
        do{
            
            let img = try await APIManager.downloadImage(url: URL(string: simple.thumb)!)
            return img
        }catch{
            return Image(systemName: "photo")
        }
    }
    
}

public class DetailDessertCombineSerivice: DetailDessertAPISerivce{
    
    override public init(mealModel: MealModel){
        super.init(mealModel:mealModel)
        
    }
    public func addsubscriber() {
        
    }
}
