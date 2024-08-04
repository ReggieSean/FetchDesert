//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

//Viewmodel that is responsible for publishing models to populate its view
//assume that there will be a small amount of desert
//DessertViewModel will not to load all assets of all DetailDesertModel at the begining.
@MainActor
public class DessertViewModel: ObservableObject{
    @Published public var ms  : [MealModel] = []
    public var currentIdx = 0
    public var allList : [String] = []
    //load all the desert Name only
    public init() {
        print("Init DessertVM")
        Task(priority: .high){
            let apimanager = APIManager.shared
            if let list = await apimanager.reteriveAllDessert(){
                await MainActor.run(body: {
                    print("DessertVM: Reterived all dessert list")
                    self.ms = list
                })
            }else{
                print("DessertVM init: Failed to reterive list of All Dessert")
            }
        }
    }
    
    
    public func loadMoreDessert() async throws -> (){
    }
}
