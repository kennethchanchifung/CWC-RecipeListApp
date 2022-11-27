//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var categories = Set<String>()
    @Published var selectedCategory: String?
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        self.categories = Set(self.recipes.map({ recipe in return recipe.category }))
        self.categories.update(with: Constants.defaultListFilter)
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            // Get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // Get a target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // Calcuated whole portions
                wholePortions = numerator / denominator
                // Calculated the remainder
                numerator = numerator % denominator
                // Assign to portion string
                portion += String(wholePortions)
            }
            
            // Express the reminder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += String("\(numerator)/\(denominator)")
            }
        }
        
        if var unit = ingredient.unit{
            
            // If we need to pluralize
            if wholePortions > 1 {
                
                // Calculate appripriate suffix
                if unit.suffix(2) == "ch"{
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            // Calculate appropriate siffix
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return "\(portion) \(unit)"
        }
        
        return portion
    }
    
}
