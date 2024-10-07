//
//  DesertDetailView.swift
//  FetchDessert
//
//  Created by SeanHuang on 7/31/24.
//

import SwiftUI
import FetchDessertPkg
import AVKit

struct DessertDetailView: View {
    let dessert : MealModel
    @State var dessertDetail : DetailMealModel?
    @State var thumbImage : Image?
    public init(dessert: MealModel){
        self.dessert = dessert
        #if DEBUG
        print("dessert \(String(describing: dessert.strMeal)) detail init")
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
                                    Text(dessert.strMeal!).font(.title).foregroundStyle(Color.white).padding()
                                    Spacer()
                                }
                            }
                            
                        }
                    } else{
                        RoundedRectangle(cornerSize: CGSize(width: 0, height: 0)).fill(LinearGradient(gradient:Gradient(colors:[Color.yellow,Color.yellow,Color.clear]), startPoint: .top, endPoint: .bottom)).frame( height: 300).overlay{
                            VStack{
                                Spacer()
                                Text(dessert.strMeal!).font(.title)
                            }
                        }
                    }
                    if dessertDetail != nil{
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
            }
        }.ignoresSafeArea().onAppear{
            loadDessert()
        }
    }
    
    @ViewBuilder private var ingredients: some View{
                Section(header: Text("Ingredaients").font(.body).padding(0)){
                    ForEach(dessertDetail!.mizanplas.sorted(by: { $0.key < $1.key }), id: \.key){ key, value in
                        HStack(alignment: .center){
                            Text((key))
                            Text((value))
                        }
                    }
                }
    }
    
    @ViewBuilder private var instructions: some View{
        if let instructions = dessertDetail?.instructions{
            Section(header: Text("Instructions").font(.body).padding(0)){
                Text(instructions)
            }
        }
    }
    
    @ViewBuilder private var drinkAlternative: some View{
        if let drink = dessertDetail?.drinkAlt{
            Section(header: Text("Drink Alternate").font(.body).padding(0)){
                Text(drink)
            }
        }
    }

    @ViewBuilder private var area: some View{
        if let area = dessertDetail?.area{
            Section(header: Text("Dessert region:").font(.body).padding(0)){
                Text(area)
            }
        }
    }

    @ViewBuilder private var category: some View{
        if let category = dessertDetail?.category{
            Section(header: Text("Category:").font(.body).padding(0)){
                Text(category)
            }
        }
    }
    
    @ViewBuilder private var tags: some View{
        if let tags = dessertDetail?.tags{
            Section(header: Text("Tags:").font(.body).padding(0)){
                Text(tags)
            }
        }
    }
    
    @ViewBuilder private var youtube: some View{
        if let link = dessertDetail?.yotube, !link.isEmpty{
            Section(header: Text("Link to Video:").font(.body).padding(0)){
                Link("Open in Browser", destination: URL(string: link)!)
            }
        }
    }
    
    @ViewBuilder private var date: some View{
        if let date = dessertDetail?.date{
            Section(header: Text("Last Modified on:").font(.body).padding(0)){
                Text(date)
            }
        }
    }

    private func loadDessert() -> Void{
        Task{
            if let meal = await APIManager.shared.reteriveDesert(id: dessert.id){
                dessertDetail = meal
            }
            if let thumb = dessertDetail?.thumb, !thumb.isEmpty{
                if let img = await APIManager.shared.downloadImage(mealThumb: URL(string:thumb)!){
                    thumbImage = img
                }
            }else{
                print("\(dessert.strMeal!)'s thumbImg is empty")
            }
            
        }
    }
}

#Preview ("DessertDetail"){
    let mealData = """
    {
    "strMeal":"Apam balik","strMealThumb":"https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg","idMeal":"53049"
    }
    """
    let decoder = JSONDecoder()
    let jsonString = mealData.data(using: .utf8)!
    do{
        let model = try decoder.decode(MealModel.self, from:jsonString)
        return DessertDetailView(dessert:  (model))
    } catch{}
    //return Text()
    return Text("Error SingleDessert")
}
