//
//  Bakery.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/27/24.
//
import SwiftUI
import FetchDessertPkg

struct DessertView: View {
    @StateObject var bakery = DessertViewModel()
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).ignoresSafeArea().overlay{
            DessertBlock(desserts: [])
        }
    }
    
}

#Preview {
    DessertView()
}
