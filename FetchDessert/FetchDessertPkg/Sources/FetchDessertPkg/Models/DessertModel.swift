//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation
import SwiftUI

//DesertModel for holding meal information

public struct DessertModel{
    public let mealName : String
    public let Instructions: String
    public let Ingredients: String
    public let image : Image?

    public init(mealName: String, Instructions: String, Ingredients: String, image: Image?) {
        self.mealName = mealName
        self.Instructions = Instructions
        self.Ingredients = Ingredients
        self.image = image
    }
}
