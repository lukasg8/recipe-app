//
//  RecipeDetailView.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServings = 2
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                
                // MARK: Recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                
                // MARK: Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("",selection: $selectedServings) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:200)
                }
                .padding(.leading,10)
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.title)
                        .padding(.bottom,5)
                    
                    ForEach (recipe.ingredients) { ingredient in
                        Text("- " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedServings) + ingredient.name.lowercased())
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
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
