//
//  ContentView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    private var title: String {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return Constants.defaultListFilter
        }
        else {
            return model.selectedCategory!
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text(title)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes) { r in
                            if model.selectedCategory == nil ||
                                model.selectedCategory == Constants.defaultListFilter ||
                                r.category == model.selectedCategory {
                                NavigationLink(
                                    destination: RecipeDetailView(recipe:r),
                                    label: {
                                        
                                        // MARK: Row item
                                        HStack(spacing: 20.0) {
                                            Image(r.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .clipped()
                                                .cornerRadius(5)
                                            VStack(alignment: .leading){
                                                Text(r.name)
                                                    .foregroundColor(.black)
                                                    .font(Font.custom("Avenir Heavy", size: 16))
                                                RecipeHighlightsView(highlights: r.highlights)
                                            }
                                            .foregroundColor(.black)
                                        }
                                    })
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
