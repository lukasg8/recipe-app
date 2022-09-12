//
//  RecipeModel.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
    
}
