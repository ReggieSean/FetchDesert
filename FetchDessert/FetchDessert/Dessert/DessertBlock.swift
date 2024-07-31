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
    var blockSize : Int
    @State var desserts : [DessertModel]
    init(blockSize: Int, desserts : [DessertModel]) {
        self.blockSize = blockSize
        self.desserts = desserts
    }
    
    var body: some View {
        block
    }
        
    @ViewBuilder private var block: some View{
        VStack{
            ScrollView{
                HStack{
                    ForEach(desserts, id: \.mealName){ dessert in
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).frame(width: 150,height: 150).opacity(0.5).foregroundStyle(Color.yellow)
                                
                            dessert.image!.resizable().scaledToFit().frame(width: 100, height:100,alignment: .center).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                        
                            Text("\(dessert.mealName)").padding(EdgeInsets(top:10, leading: 0, bottom: 10, trailing: 0)).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).foregroundStyle(Color.white)
                                
                            
                        }.onTapGesture {
                            print("Dessert: \(dessert.mealName) is tapped")
                        }
                    }
                }
            }
        }
    }
    
}

#Preview ("Single Dessert"){
    DessertBlock(blockSize: 10, desserts:  [DessertModel(mealName: "Apple", Instructions: "Peel Apple", Ingredients: "Apple x1", image: Image(systemName: "apple.logo"))])
}
