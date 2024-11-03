//
//  Category.swift
//  FetchDessertAltUI
//
//  Created by SeanHuang on 11/2/24.
//

import Foundation
import SwiftUI

enum Category: Int, CaseIterable, Identifiable {
    case dessert
   

    var id: Int { rawValue }

    var localizedName: LocalizedStringKey {
        switch self {
            case .dessert:
                return "Dessert"
        }
    }
}
