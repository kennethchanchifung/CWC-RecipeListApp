//
//  Recipe.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeJSON: Identifiable, Decodable {
    
    var id:UUID?
    var category:String
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights: [String]
    var ingredients:[IngredientJSON]
    var directions:[String]
    
}

class IngredientJSON: Identifiable, Decodable {
    
    var id: UUID?
    var name: String = ""
    var num: Int?
    var denom: Int?
    var unit: String?
    
}
