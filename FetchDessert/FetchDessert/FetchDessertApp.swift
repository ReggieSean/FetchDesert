//
//  FetchDessertApp.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/26/24.
//

import SwiftUI

@main
struct FetchDessertApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationLink("DessertView", destination: DessertView())
        }
    }
}
