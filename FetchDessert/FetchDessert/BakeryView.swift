//
//  Bakery.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/27/24.
//
import SwiftUI
import FetchDessertPkg

struct BakeryView: View {
    @StateObject var bakery = BakeryViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BakeryView()
}
