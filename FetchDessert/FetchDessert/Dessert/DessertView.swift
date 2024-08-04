//
//  FetchDessert
//
//  Created by SeanHuang on 7/27/24.
//
import SwiftUI
import FetchDessertPkg

struct DessertView: View {
    @StateObject var bakery = DessertViewModel()
    var body: some View {
        NavigationView{
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).foregroundStyle(Color.white).ignoresSafeArea().overlay{
                DessertBlock(desserts: $bakery.ms)
            }.navigationTitle("Desserts").font(.largeTitle)
        }
    }
    
}

#Preview {
    DessertView()
}
