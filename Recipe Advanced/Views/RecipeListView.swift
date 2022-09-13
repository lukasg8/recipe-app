//
//  RecipeListView.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/12/22.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        // Once XCode comes out of Beta, use NavigationStack instead of NavigationView
        // https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types
        
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
