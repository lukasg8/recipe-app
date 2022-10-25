//
//  RecipeCategoryView.swift
//  Recipe Advanced
//
//  Created by Lukas on 10/21/22.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    @Binding var selectedTab: Int
    
    var body: some View {

        VStack (alignment: .leading) {
            
            Text("Categories")
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy",size:28))
            
            LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20, content: {
                
                ForEach(Array(model.categories), id: \.self) { category in
                    
                    Button(action: {
                        // swithc tabs to list view
                        selectedTab = Constants.listTab
                        // set selected category
                        model.selectedCategory = category
                    }, label: {
                        Text(category)
                    })
                    
                }
            })
        }
    }
}
