//
//  RecipeListView.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(destination: RecipeDetailView(recipe:r), label: {
                    
                    HStack {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipped()
                        .cornerRadius(8)
                        
                        Text(r.name)
                    }
                    
                })
            }
            .navigationTitle("All Recipes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
