//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation
import SwiftUI

public struct DetailMealResponse : Decodable{
    public let meals : [DetailMealModel]
    
}
//extension DetailMealResponse: Decodable{
//    public init(from decoder: any Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        self.meals = try container.decode([DetailMealModel].self)
//    }
//}

extension DetailMealModel: Decodable{
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: DessertKeys.self)
        self.id = Int(try container.decode(String.self, forKey: .id)) ?? 0
        self.meal = try container.decodeIfPresent(String.self, forKey: .meal) ?? ""
        self.drinkAlt = try container.decodeIfPresent(String.self, forKey: .drinkAlt) ?? ""
        self.category = try container.decodeIfPresent(String.self, forKey: .category) ?? ""
        self.area = try container.decodeIfPresent(String.self, forKey: .area) ?? ""
        self.instructions  = try container.decodeIfPresent(String.self, forKey: .instructions) ?? ""
        self.tags = try container.decodeIfPresent(String.self, forKey: .tags) ?? ""
        self.thumb = try container.decodeIfPresent(String.self, forKey: .thumb) ?? ""
        self.yotube = try container.decodeIfPresent(String.self, forKey: .youtube) ?? ""
        self.src = try container.decodeIfPresent(String.self, forKey: .src) ?? ""
        self.imageSrc = try container.decodeIfPresent(String.self, forKey: .imageSrc) ?? ""
        self.ccc  = try container.decodeIfPresent(String.self, forKey: .ccc) ?? ""
        self.date  = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        
        var miz = [String:String]()
        for i in 1...20 {
                    // Dynamically construct ingredient and measurement keys
                    let ingredientKey = DessertKeys(stringValue: "strIngredient\(i)")!
                    let measurementKey = DessertKeys(stringValue: "strMeasure\(i)")!
                    
                    // Decode the ingredient and its measurement if they exist
                    if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty {
                        let measure = try container.decodeIfPresent(String.self, forKey: measurementKey) ?? "TBD"
                        miz[ingredient] = measure
                    }
                }
        self.mizanplas = miz
        
    }
}
extension DetailMealModel: Encodable{
    public func encode(to encoder: any Encoder) throws {
        
    }
}

 
//DesertModel for holding meal information
//assume there must be an unique id for any meal
public struct DetailMealModel:  Identifiable{
    public let id: Int
    public let meal: String
    public let drinkAlt: String
    public let category: String
    public let area: String
    public let instructions : String
    public let tags: String
    public let thumb: String
    public let yotube: String
    public let src: String
    public let imageSrc : String
    public let ccc : String
    public let date : String
    public let mizanplas :[String:String]

    
    
  
    enum DessertKeys: String, CodingKey {
        case id = "idMeal"
        case meal = "strMeal"
        case drinkAlt = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case tags = "strTags"
        case thumb = "strMealThumb"
        case youtube = "strYoutube"
        case src = "strSource"
        case imageSrc = "strImageSource"
        case ccc = "strCreativeCommonsConfirmed"
        case date = "dateModified"
        case ingredient1  = "strIngredient1"
        case ingredient2  = "strIngredient2"
        case ingredient3  = "strIngredient3"
        case ingredient4  = "strIngredient4"
        case ingredient5  = "strIngredient5"
        case ingredient6  = "strIngredient6"
        case ingredient7  = "strIngredient7"
        case ingredient8  = "strIngredient8"
        case ingredient9  = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        
        case measure1  = "strMeasure1"
        case measure2  = "strMeasure2"
        case measure3  = "strMeasure3"
        case measure4  = "strMeasure4"
        case measure5  = "strMeasure5"
        case measure6  = "strMeasure6"
        case measure7  = "strMeasure7"
        case measure8  = "strMeasure8"
        case measure9  = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        
    }
    
 
    
    
 
//    public var allTags : [String]{
//        if let tags = strTags {
//            return tags.split(separator: ",") as! [String]
//        }
//        return[]
//    }
}
