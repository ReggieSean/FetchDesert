//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

extension APIManager{
    func allMealAPI(catagory: String) -> URL?{
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=\(catagory)") else{
           return nil
        }
        return url
    }
    func mealPrep(mealID : Int) -> URL?{
        guard let url = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else{
           return nil
        }
        return url
    }
}
