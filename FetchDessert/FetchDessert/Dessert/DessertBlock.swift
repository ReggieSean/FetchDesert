//
//  DesertBlock.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/31/24.
//

import FetchDessertPkg
import SwiftUI

//Block that load a group of desserts
struct DessertBlock: View {
    @Binding var desserts : [MealModel]

    init( desserts : Binding<[MealModel]>) {
        self._desserts = desserts
    }
    var body: some View {
        block
    }
        
    @ViewBuilder private var block: some View{
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        VStack{
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 10){//use Lazylayout for performance
                        ForEach(desserts, id: \.id) { dessert in
                            NavigationLink(destination: DessertDetailView(dessert: dessert))
                                {
                                    DessertCell(dessertModel: dessert)
                                }
                        }
                    }
                }
            }
    }
    
}

struct DessertCell : View{
    
    let dessertModel: MealModel
    @State var image : Image? = nil
    var count = 0
    init(dessertModel: MealModel) {
        self.dessertModel = dessertModel
    }
    var body: some View{
        ZStack(alignment: .center){
            //RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150,height: 150).opacity(1).foregroundStyle(Color.yellow)
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150, height: 150).opacity(0.5).foregroundStyle(Color.yellow).overlay{
                ZStack{
                    if let image = image{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150, height: 150).opacity(0.5).foregroundStyle(Color.yellow).overlay(
                            image.resizable().scaledToFit().frame(width: 150, height:150,alignment: .center).clipped().clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                        )
                    }
                    VStack{
                        Spacer()
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150, height: 80).opacity(0.7).foregroundStyle(Color.gray).overlay{
                            
                            Text(" \(dessertModel.strMeal!)").foregroundStyle(Color.white).font(.title3).frame(width: 150, height: 80,alignment: .leading).padding(0).clipped()
                            
                        }.offset(CGSize(width: 0,height: -15.0)).clipped().offset(CGSize(width: 0,height: 15.0))
                        
                    }
                }
                
//                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150,height: 150).opacity(1).foregroundStyle(Color.yellow)
                //halfish icon size overlay title
                
            }
        }.task{
            //print("Dessert: \(dessertModel.strMeal!) is tapped")
            if  let imgStr = dessertModel.strMealThumb{
                image = await APIManager.shared.downloadImage(mealThumb: imgStr)
            }
        }
    }
    
}
//
#Preview ("Single Dessert"){
    let mealData = """
    {
    "strMeal":"Apam balik","strMealThumb":"https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg","idMeal":"53049"
    }
    """
    let decoder = JSONDecoder()
    let jsonString = mealData.data(using: .utf8)!
    do{
        let model = try decoder.decode(MealModel.self, from:jsonString)
        return DessertBlock(desserts:  .constant([model]))
    } catch{}
    //return Text()
    return Text("Error SingleDessert")
}
#Preview (" 2 Desserts"){
    let mealData = """
    {
    "strMeal":"Apam balik","strMealThumb":"https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg","idMeal":"53049"
    }
    """
    let decoder = JSONDecoder()
    let jsonString = mealData.data(using: .utf8)!
    do{
        let model = try decoder.decode(MealModel.self, from:jsonString)
        return DessertBlock(desserts:  .constant([model, model]))
    } catch{}
    //return Text()
    return Text("Error SingleDessert")
}
//#Preview ("3 Dessert"){
//    DessertBlock( desserts:
//                    ])
//}
//#Preview ("5 Dessert"){
//    DessertBlock( desserts:
//                    [
//                    ])
//}
