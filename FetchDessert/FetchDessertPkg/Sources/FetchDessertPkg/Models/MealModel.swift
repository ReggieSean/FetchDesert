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


public struct MealResponse: Decodable{
    public let meals : [MealModel]
}

public struct MealModel : Identifiable{
    
    public let id: Int
    public let meal: String
    public let thumb : String
}

extension MealModel: Decodable{
    enum Keys: String, CodingKey{
        case id = "idMeal"
        case meal = "strMeal"
        case thumb = "strMealThumb"
    }
    
    public init( from decoder: any Decoder) throws{
        let container = try decoder.container(keyedBy: Keys.self)
        self.id = Int(try container.decode(String.self, forKey: .id)) ?? 0
        self.meal =  try container.decodeIfPresent(String.self, forKey: .meal) ?? ""
        self.thumb =  try container.decodeIfPresent(String.self, forKey: .thumb) ?? ""

    }
}
