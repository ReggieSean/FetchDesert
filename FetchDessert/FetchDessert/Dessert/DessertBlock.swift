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
                LazyVGrid(columns: columns,spacing: 20){
                    ForEach(desserts.indices, id: \.self) { index in
                        DessertCell(dessertModel: desserts[index])
                    }
                }
            }
        }
    }
    
}

struct DessertCell : View{
    let dessertModel: MealModel
    let image : Image? = nil
    init(dessertModel: MealModel) {
        self.dessertModel = dessertModel
    }
    var body: some View{
        ZStack(alignment: .center){
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150,height: 150).opacity(1).foregroundStyle(Color.yellow)
            
            image!.resizable().scaledToFit().frame(width: 150, height:150,alignment: .center).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150, height: 150).opacity(0).foregroundStyle(Color.red).overlay{
                //halfish icon size overlay title
                VStack{
                    Spacer()
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150, height: 80).opacity(0.7).foregroundStyle(Color.gray).overlay{
                        
                        Text(" \(dessertModel.strMeal!)").foregroundStyle(Color.white).font(.title2).frame(width: 150, height: 80,alignment: .leading).padding(0).clipped()
                        
                    }.offset(CGSize(width: 0,height: -15.0)).clipped().offset(CGSize(width: 0,height: 15.0))
                    
                }
                
            }
        }.onTapGesture {
            print("Dessert: \(dessertModel.strMeal!) is tapped")
            
        }
    }
    
}
//
//#Preview ("Single Dessert"){
//    DessertBlock(desserts:  [MealModel(mealName: "Apple", Instructions: "Peel Apple", Ingredients: "Apple x1", image: Image(systemName: "apple.logo"))])
//}
//#Preview ("3 Dessert"){
//    DessertBlock( desserts:
//                    ])
//}
//#Preview ("5 Dessert"){
//    DessertBlock( desserts:
//                    [
//                    ])
//}
