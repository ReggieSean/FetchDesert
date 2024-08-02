//
//  File.swift
//  
//
//  Created by SeanHuang on 7/27/24.
//

import Foundation

//Viewmodel that is responsible for publishing models to populate its view
//DessertViewModel will try not to load all assets of all DesertModel at once.
@MainActor
public class DessertViewModel: ObservableObject{
    @Published var dms  : [DessertModel] = []
    var currentIdx = 0
    var allList : [String] = []
    //load all the desert Name only
    public init() {
        print("Init DessertVM")
        Task(priority: .high){
            let apimanager = APIManager.shared
            if let list = await apimanager.reteriveAllDesert(){
                await MainActor.run(body: {
                    //print("Thread \(Thread.current)")
                    self.allList = list
                })
            }else{
                print("Failed to reterive at Thread")
            }
        }
    }
    
    
    public func loadMoreDessert() async throws -> (){
        if(currentIdx + 10 < dms.count){
            
        }
    }
}
