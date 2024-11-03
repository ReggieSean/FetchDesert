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
    @StateObject var mealVM : DessertViewModel
        
    @State var category : Category? = .dessert
    @State var paths = [String]()
    @State var selectedMeal : MealModel?
    
    var body: some View {
        //splitview so more categories can be added
        NavigationSplitView{
            List(Category.allCases, selection: $category){category in
                NavigationLink(category.localizedName){
                    Text("\(category.localizedName)")
                }.onSubmit {
                    switch category{
                        case .dessert:
                            _mealVM = StateObject(wrappedValue:  DessertViewModel(apiService: DessertAPIAsyncService()))
                    }
                }
            }.navigationTitle("Categories")
        } detail:{
            NavigationStack(path:$paths){
                List(mealVM.ms, selection:  $selectedMeal){ dessert in
                    NavigationLink(value: dessert){
                        DessertDetailView()
                    }
                }
            }.navigationTitle(category!.localizedName)
        }
    }
    
}
    

#Preview {
    MealView()
}

