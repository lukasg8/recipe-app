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
            VStack (alignment: .leading) {
                Text("All Recipes")
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(destination: RecipeDetailView(recipe:r), label: {
                                
                                HStack {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60, alignment: .center)
                                        .clipped()
                                    .cornerRadius(8)
                                    
                                    Text(r.name)
                                        .foregroundColor(.black)
                                }
                                
                            })
                        }

                    }
                }
                
            }
            .padding(.leading)
            .navigationBarHidden(true)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
