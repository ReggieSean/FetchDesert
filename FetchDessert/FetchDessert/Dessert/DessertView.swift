//
//  FetchDessert
//
//  Created by SeanHuang on 7/27/24.
//
import SwiftUI
import FetchDessertPkg

struct DessertView: View {
    @StateObject var bakery = DessertAccessBehavior(apiService: DessertAPIAsyncService())
    var body: some View {
        NavigationView{
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).foregroundStyle(Color.white).ignoresSafeArea().overlay{
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                VStack{
                    ScrollView{
                        LazyVGrid(columns: columns,spacing: 10){//use Lazylayout for performance
                            ForEach(bakery.ms, id: \.id) { dessert in
                                NavigationLink(destination: DessertDetailView(apiService: DetailDessertAsyncSerivice(mealModel: dessert)))
                                {
                                    DessertCell(dessertModel: dessert)
                                }
                            }
                        }
                    }
                }
                
                
            }
            
        }.navigationTitle("Desserts").font(.largeTitle)
        
    }
    
}
    
    


#Preview {
    DessertView()
}
//Block that load a group of desserts

