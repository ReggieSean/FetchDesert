//
//  FetchDessertAltUIApp.swift
//  FetchDessertAltUI
//
//  Created by SeanHuang on 10/31/24.
//

import SwiftUI
import FetchDessertPkg

@main
struct FetchDessertAltUIApp: App {
    var body: some Scene {
        WindowGroup {
            MealView(mealVM: MealViewModel(specificVMBehavior: DessertAccessBehavior(apiService: DessertAPIAsyncService())))
        }
    }
}
