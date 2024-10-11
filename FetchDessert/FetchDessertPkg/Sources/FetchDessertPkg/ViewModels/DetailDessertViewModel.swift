//
//  File.swift
//  
//
//  Created by SeanHuang on 10/11/24.
//

import Foundation
import SwiftUI

public class DetailDessertViewModel: ObservableObject{
    @Published public var model: DetailMealModel?
    @Published public var thumb: Image?
    
    public var apiService: DetailDessertAPISerivce
   
    //model is passed in for setting up the detail model
    public init(apiService : DetailDessertAPISerivce){
        self.apiService = apiService
    }
    
    public func initPage(){
        if let service = apiService as? DetailDessertAsyncSerivice{
            Task(priority: .high){
                if let model = await service.reteriveDessert(){
                    let img = await service .retreiveImage()
                    await MainActor.run(body: {
                        self.thumb = img
                        self.model = model
                    })
                }else{
                    print("DessertDetailVM init: Failed to retreive detial")
                }
            }
        } else if let service = apiService as? DetailDessertCombineSerivice{
        } else{
            print("Init DetailDessertVM Service failed ")
        }
    }
    
}
