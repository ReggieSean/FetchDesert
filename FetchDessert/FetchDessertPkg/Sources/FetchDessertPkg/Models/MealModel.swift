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


public struct MealResponse : Codable{
    public let meals : [DetailMealModel]
}

public class MealModel : Codable{
    public let strMeal: String
    public let idMeal : Int
    public let strMealThumb: URL?

    public init(mealName: String, idMeal: Int, strMealThumb: URL){
        self.strMeal = mealName
        self.idMeal = idMeal
        self.strMealThumb = strMealThumb
    }
}
