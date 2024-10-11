//
//  DesertBlock.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/31/24.
//

import FetchDessertPkg
import SwiftUI



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
                            
                            Text(" \(dessertModel.meal)").foregroundStyle(Color.white).font(.title3).frame(width: 150, height: 80,alignment: .leading).padding(0).clipped()
                            
                        }.offset(CGSize(width: 0,height: -15.0)).clipped().offset(CGSize(width: 0,height: 15.0))
                        
                    }
                }
                
                //halfish icon size overlay title
                
            }
        }.task{
            //print("Dessert: \(dessertModel.strMeal!) is tapped")
            do{
                image = try await APIManager.downloadImage(url: URL(string: dessertModel.thumb)!, session: URLSession.shared)
            } catch{
               image = Image(systemName: "photo")
            }
        }
    }
    
}
//

//#Preview ("3 Dessert"){
//    DessertBlock( desserts:
//                    ])
//}
//#Preview ("5 Dessert"){
//    DessertBlock( desserts:
//                    [
//                    ])
//}
