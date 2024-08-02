//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation
import SwiftUI

enum APIError : Error{
    case requestError(String)
    case responseCastError(String)
    case decodeError(String)
}



public class APIManager :ObservableObject{
   
    
    
    public static var shared = APIManager()
    
    public init(){}
    
    
    public func reteriveAllDesert() async -> [MealModel]?{
        let apimanger = APIManager.shared
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: apimanger.allMealAPI(catagory: "Dessert")!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("testDownload response")
            }
            let decoder = JSONDecoder()
            let mealResponse = try decoder.decode(MealResponse.self, from: data)
            return mealResponse.meals
        } catch let Error{
            print(Error)
        }
        return nil
    }
    
    public func reteriveDesert(id : Int) async -> DetailMealModel?{
        let apimanger = APIManager.shared
        let session = URLSession.shared
        do{
            let (data, response) = try await session.data(from: apimanger.mealPrep(mealID: id)!)
            guard let response = response as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("failed to reterive Dessret")
            }
            let decoder = JSONDecoder()
            let mealResponse = try decoder.decode(DetailMealResponse.self, from: data)
            return mealResponse.meals[0]
        } catch let Error{
            print(Error)
        }
        return nil
    }
    
    public func downloadImage(mealThumb: String) async -> Image? {
        let session = URLSession.shared
        do{
            let imageURL = URL(string: mealThumb.replacingOccurrences(of: "\\/", with: "/"))!
            let (imageData, imageResponse) = try await session.data(from:  imageURL)
            guard let response = imageResponse as? HTTPURLResponse , response.statusCode >= 200 && response.statusCode < 400 else{
                throw APIError.responseCastError("failed to download image")
            }
        } catch let Error{
            print(Error)
        }
        return nil
    }
}
