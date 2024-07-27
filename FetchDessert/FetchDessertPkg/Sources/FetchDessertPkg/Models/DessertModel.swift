//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

final class DessertModel{
    let mealName : String
    let Instructions: String
    let Ingredients: String
    
    init(mealName: String, Instructions: String, Ingredients: String) {
        self.mealName = mealName
        self.Instructions = Instructions
        self.Ingredients = Ingredients
    }
}
