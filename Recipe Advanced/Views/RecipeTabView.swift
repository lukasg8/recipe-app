//
//  RecipeTabView.swift
//  Recipe Advanced
//
//  Created by Lukas on 9/13/22.
//

import SwiftUI

struct RecipeTabView: View {
    
    
    
    var body: some View {
        TabView {
            Text("Featured")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
            }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
