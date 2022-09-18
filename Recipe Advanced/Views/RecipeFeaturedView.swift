//
//  RecipeFeaturedView.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/13/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy",size:28))
            
            GeometryReader { geo in
                TabView (selection: $tabSelectionIndex) {
                    
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            Button(action: {
                                
                                isDetailViewShowing = true
                                
                            }, label: {
                                
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack {
                                        
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(Font.custom("Avenir",size:15))
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe:model.recipes[index])
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y:5)
                            .buttonStyle(PlainButtonStyle())
                                                        
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Preparation time")
                    .font(Font.custom("Avenir Heavy",size:18))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir",size:15))
                
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy",size:18))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir",size:15))
            }
            .padding([.leading,.bottom])
        }
        .onAppear(perform: {
            firstFeaturedIndex()
        })
    }
    
    func firstFeaturedIndex() {
        
        // Find first recipe that is featured
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
        
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
