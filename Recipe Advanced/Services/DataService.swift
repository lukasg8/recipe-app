//
//  DataService.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for r in recipeData {
                    
                    // Add unique identifier for each recipe
                    r.id = UUID()
                    
                    // Add unique identifier for each ingredient in recipe
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                    
                }
                
                return recipeData
                
            }
            catch {
                
                print(error)
                
            }
            
        }
        catch {
            
            print(error)
            
        }
        
        return [Recipe]()
        
    }
    
}

