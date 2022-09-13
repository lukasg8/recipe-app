//
//  RecipeDetailView.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    // unset because it will be determined by what the user taps on
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title)
                        .padding(.bottom,5)
                    
                    ForEach (recipe.ingredients) { ingredient in
                        Text("- " + ingredient.name)
                            .padding(.bottom, 3.0)
                    }
                }.padding(.leading,7.0)
                    
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.title)
                    
                    ForEach (0...recipe.directions.count-1, id: \.self) { index in
                        
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.vertical, 1.0)
                        
                    }
                }.padding(.leading,7.0)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
