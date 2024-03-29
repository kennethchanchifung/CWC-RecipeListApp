//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by k on 28/10/2022.
//

import SwiftUI

struct RecipeTabView: View {
    
    @State var selectedTab = Constants.featuredTab
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            RecipeFeaturedView()
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
                .tag(Constants.featuredTab)
            RecipeCategoryView(selectedTab: $selectedTab)
                .tabItem{
                    VStack{
                        Image(systemName: "square.grid.2x2")
                        Text("Categories")
                    }
                }
                .tag(Constants.categoriesTab)
            AddRecipeView(selectedTab: $selectedTab)
                .tabItem {
                    VStack{
                        Image(systemName: "plus.circle")
                        Text("Add")
                    }
                }
                .tag(Constants.addRecipeTab)
            RecipeListView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
                .tag(Constants.listTab)
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
