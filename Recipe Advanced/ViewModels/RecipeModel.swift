//
//  RecipeModel.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var categories = Set<String>()
    @Published var selectedCategory: String?
    
    init() {
        
        // create an instance of data service and get data
        self.recipes = DataService.getLocalData()
        
        self.categories = Set(self.recipes.map { r in
            return r.category
        })
        self.categories.update(with: Constants.defaultListFilter)
            
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        
        if ingredient.num != nil {
            denominator *= recipeServings
            
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                portion += String(wholePortions)
            }
            
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
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
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            portion += unit
        }
        
        return portion
    }
    
}
