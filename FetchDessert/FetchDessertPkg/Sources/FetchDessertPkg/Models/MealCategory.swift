//
//  Category.swift
//  FetchDessertAltUI
//
//  Created by SeanHuang on 11/2/24.
//

import Foundation
import SwiftUI

public enum MealCategory: Int, CaseIterable, Identifiable {
    case dessert
   

    public var id: Int { rawValue }

    public var localizedName: LocalizedStringKey{
        switch self {
            case .dessert:
                return "Dessert"
        }
    }
}
