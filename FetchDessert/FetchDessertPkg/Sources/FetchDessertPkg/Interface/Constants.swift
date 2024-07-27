//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

extension APIManager{
    func allMealAPI(catagory: String) -> String{ "https://themealdb.com/api/json/v1/1/filter.php?c=\(catagory)"
    }
    func mealPrep(mealID : String) -> String{
        "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
    }
}
