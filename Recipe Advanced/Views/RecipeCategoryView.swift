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
                .padding(.leading)
                .font(Font.custom("Avenir Heavy",size:28))
            
            GeometryReader { geo in
                
                ScrollView (showsIndicators: false) {
                    LazyVGrid (columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20, content: {
                        
                        ForEach(Array(model.categories), id: \.self) { category in
                            
                            Button(action: {
                                // swithc tabs to list view
                                selectedTab = Constants.listTab
                                // set selected category
                                model.selectedCategory = category
                            }, label: {
                                VStack {
                                    Image(category.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width - 25)/2, height: (geo.size.width - 25)/2)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(category)
                                        .foregroundColor(.black)
                                    
                                }
                            })
                        }
                    })
                }
                .padding(.bottom,30)
                
            }
            .padding(.horizontal)
            
        }
    }
}
