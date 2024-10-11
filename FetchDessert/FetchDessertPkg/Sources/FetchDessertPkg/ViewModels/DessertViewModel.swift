//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

//Viewmodel that is responsible for publishing models to populate its view
//assume that there will be a small amount of desert
//DessertViewModel will not load all assets for all DetailDesertModel at the begining.
public class DessertViewModel : ObservableObject{
    @Published public var ms  : [MealModel] = []
    public var apiService : DessertAPIService
    //load all the desert Name only
    public init(apiService : DessertAPIService ) {
        
        self.apiService = apiService
        if let service = self.apiService as? DessertAPIAsyncService{
            Task(priority: .high){
                if let list = await service.retreiveAllDessert(){
                    await MainActor.run(body: {
                        print("DessertVM: Reterived all dessert list")
                        self.ms = list.sorted { $0.meal < $1.meal}
                    })
                }else{
                    print("DessertVM init: Failed to reterive list of All Dessert")
                }
            }
        } else if let service = self.apiService as? DessertAPICombineService{
           //TODO implement functions for Combine style of service interface
        }else{
            print("Init DessertVM Service failed ")
        }
    }
    
 
}


