//
//  ContentView.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import SwiftUI






struct ContentView: View {
    @StateObject var viewmodel = ViewModel()
    @State private var imageCache: [URL: Data] = [:]

    var body: some View {
        NavigationView {
            List(viewmodel.recipes, id: \.idMeal) { recipe in
                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                    HStack {
                        if let url = URL(string: recipe.strMealThumb), let imageData = imageCache[url] {
                            Image(uiImage: UIImage(data: imageData) ?? UIImage())
                                .resizable()
                                .frame(width: 70, height: 70)
                                .background(Color.gray)
                                .cornerRadius(5.0)
                        } else {
                            ProgressView()
                        }
                        Text(recipe.strMeal)
                            .bold()
                    }
                    .padding(3)
                    .onAppear {
                        if let url = URL(string: recipe.strMealThumb), imageCache[url] == nil {
                            viewmodel.loadImage(url: url) { data in
                                if let data = data {
                                    DispatchQueue.main.async {
                                        imageCache[url] = data
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
            .onAppear {
                viewmodel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
