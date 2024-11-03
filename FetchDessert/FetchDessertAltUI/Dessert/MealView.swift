//
//  DessertView.swift
//  FetchDessertAltUI
//
//  Created by SeanHuang on 10/31/24.
//

import Foundation
import SwiftUI
import FetchDessertPkg

extension View {
  func debug() -> Self {
    print(Mirror(reflecting: self).subjectType)
    return self
  }
}


struct MealView: View {
    @StateObject var mealVM : MealViewModel
        
    @State var category : MealCategory?
    @State var paths = [String]()
    @State var selectedMeal : MealModel?
   
    init(mealVM: MealViewModel,
         category: MealCategory = .dessert,
         paths: [String] = [String](),
         selectedMeal: MealModel? = nil) {
        self._mealVM = StateObject(wrappedValue: mealVM )
        self.category = category
        self.paths = paths
        self.selectedMeal = selectedMeal
    }
    
    
    var body: some View {
        //splitview so more categories can be added
        NavigationSplitView{
            List(MealCategory.allCases, selection: $category){category in
                NavigationLink(category.localizedName){
                    Text("\(category.localizedName)")
                }.onSubmit {
                    switch category{
                        case .dessert:
                            mealVM.changeBehavior(specificVMBehavior: BehaviorFactory.getVMBehavior(category: .dessert))
                            //mealVM.populateMS()
                    }
                }
            }.navigationTitle("Categories")
        } detail:{
            if mealVM.ms.isEmpty{
                HStack{
                    Text("There is no")
                    Text(category!.localizedName)
                }
            }else{
                NavigationStack(path:$paths){
                    List(mealVM.ms, selection:  $selectedMeal){ dessert in
                        NavigationLink(value: dessert){
                            DessertDetailView()
                        }
                    }
                }.navigationTitle(category?.localizedName ?? "")
            }
        }
//        .onAppear(perform: {
//            mealVM.populateMS()
//        })
    }
    
}
    

#Preview {
    MealView(mealVM: MealViewModel(specificVMBehavior: BehaviorFactory.getVMBehavior(category: .dessert)))
}

