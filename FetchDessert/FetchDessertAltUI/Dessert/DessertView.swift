//
//  DessertView.swift
//  FetchDessertAltUI
//
//  Created by SeanHuang on 10/31/24.
//

import Foundation
import SwiftUI
import FetchDessertPkg

struct DessertView: View {
    @StateObject var bakery = DessertViewModel(apiService: DessertAPIAsyncService())
    @State var paths = [String]()
    var body: some View {
        NavigationStack(path: $paths){
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).foregroundStyle(Color.white).ignoresSafeArea().overlay{
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                VStack{
                    ScrollView{
                        LazyVGrid(columns: columns,spacing: 10){
                            
                        }
                    }
                }
            }
        }.navigationTitle("Desserts").toolbar{
                ToolbarItem(placement: .navigation){
                    Text("Sort By Name")
                }
            }
    }
    
}

#Preview {
    DessertView()
}
