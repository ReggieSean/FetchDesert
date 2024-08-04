//
//  File.swift
//  
//
//  Created by SeanHuang on 8/2/24.
//

import Foundation

extension String {
    enum mealCategory{
        case Dessert
    }
}


public struct MealResponse: Codable{
    public let meals : [MealModel]
}

public struct MealModel : Codable, Identifiable{
    
    public let idMeal : String
    public let strMeal: String?
    public let strMealThumb: URL?
    public var id: Int{
        return Int(idMeal)!
    }
}
