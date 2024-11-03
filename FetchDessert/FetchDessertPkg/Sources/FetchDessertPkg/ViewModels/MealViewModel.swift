//
//  File.swift
//  
//
//  Created by SeanHuang on 11/2/24.
//

import Foundation

//a generic Viewmodel for all kind of meal
//swappable behavior for getting different kinds of meal
//currently DessertViewModel is being used as non-published behavior
public class MealViewModel: ObservableObject{
    @Published public var ms  : [MealModel] = []
    public var specificVMBehavior : MealAccessBehavior
    public init(specificVMBehavior: MealAccessBehavior) {
        self.ms = []
        self.specificVMBehavior = specificVMBehavior
        populateMS()
    }
   
    
    public func changeBehavior(specificVMBehavior: MealAccessBehavior) {
        self.specificVMBehavior = specificVMBehavior
        populateMS()
        
    }
    //denested meal access behavior's (old specific viewmodel's) populate method to MealViewModel
    public func populateMS(){
        Task{
            let ms = await specificVMBehavior.getAllMeals()
            await MainActor.run(body: {
                self.ms = ms
            })
        }
    }
    
}

public protocol MealAccessBehavior{
   func getAllMeals() async -> [MealModel]
}

public class BehaviorFactory{
    
    private init(){}
        
    static public func getVMBehavior(category : MealCategory) -> MealAccessBehavior{
        switch category{
            case .dessert:
                return DessertAccessBehavior(apiService: DessertAPIAsyncService())
        }
    }
    
}
