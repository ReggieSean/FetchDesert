//
//  DesertDetailView.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/31/24.
//

import SwiftUI
import FetchDessertPkg

//all fields will be downloaded  and passed in at previous view
struct DessertDetailView: View {
    let dessertDetail : DetailMealModel
    var thumbImage : Image?
    public init(dessertDetail: DetailMealModel){
        self.dessertDetail = dessertDetail
        #if DEBUG
        print("dessert \(String(describing: dessertDetail.meal)) detail init")
        #endif
        
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 0, height: 0)).frame(minWidth: 300 ,minHeight: 300, alignment: .center).foregroundStyle(Color.white).overlay{
                VStack(spacing:0){
                    if let img = thumbImage{
                    //image will only fill the top1/3  of canvas and the rests for form
                        img.resizable().scaledToFill().overlay{
                            VStack{
                                Spacer()
                                HStack{
                                    Text(dessertDetail.meal).font(.title).foregroundStyle(Color.white).padding()
                                    Spacer()
                                }
                            }
                            
                        }
                    } else{
                        RoundedRectangle(cornerSize: CGSize(width: 0, height: 0)).fill(LinearGradient(gradient:Gradient(colors:[Color.yellow,Color.yellow,Color.clear]), startPoint: .top, endPoint: .bottom)).frame( height: 300).overlay{
                            VStack{
                                Spacer()
                                Text(dessertDetail.meal).font(.title)
                            }
                        }
                    }
                        Form{
                            ingredients
                            instructions
                            drinkAlternative
                            area
                            youtube
                            date
                        }
                }
            }
        }.ignoresSafeArea()
    }
    
    @ViewBuilder private var ingredients: some View{
                Section(header: Text("Ingredaients").font(.body).padding(0)){
                    ForEach(dessertDetail.mizanplas.sorted(by: { $0.key < $1.key }), id: \.key){ key, value in
                        HStack(alignment: .center){
                            Text((key))
                            Text((value))
                        }
                    }
                }
    }
    
    @ViewBuilder private var instructions: some View{
            Section(header: Text("Instructions").font(.body).padding(0)){
                Text(dessertDetail.instructions)
            }
    }
    
    @ViewBuilder private var drinkAlternative: some View{
        Section(header: Text("Drink Alternate").font(.body).padding(0)){
            Text(dessertDetail.drinkAlt)
        }
    }

    @ViewBuilder private var area: some View{
            Section(header: Text("Dessert region:").font(.body).padding(0)){
                Text(dessertDetail.area)
                
            }
    }

    @ViewBuilder private var category: some View{
            Section(header: Text("Category:").font(.body).padding(0)){
                Text(dessertDetail.category)
            }
    }
    
    @ViewBuilder private var tags: some View{
            Section(header: Text("Tags:").font(.body).padding(0)){
                Text(dessertDetail.tags)
            }
    }
    
    @ViewBuilder private var youtube: some View{
            Section(header: Text("Link to Video:").font(.body).padding(0)){
                Link("Open in Browser", destination: URL(string: dessertDetail.yotube)!)
            }
    }
    
    @ViewBuilder private var date: some View{
            Section(header: Text("Last Modified on:").font(.body).padding(0)){
                Text(dessertDetail.date)
            }
    }

    
}

//#Preview ("DessertDetail"){
//    let mealData = """
//    {
//    "strMeal":"Apam balik","strMealThumb":"https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg","idMeal":"53049"
//    }
//    """
//    let decoder = JSONDecoder()
//    let jsonString = mealData.data(using: .utf8)!
//    do{
//        let model = try decoder.decode(MealModel.self, from:jsonString)
//        return DessertDetailView(dessertDetail:  model.)
//    } catch{}
//    //return Text()
//    return Text("Error SingleDessert")
//}
