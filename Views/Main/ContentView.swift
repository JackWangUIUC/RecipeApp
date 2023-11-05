//
//  ContentView.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import SwiftUI

struct RecipeResponse: Codable {
    let meals: [Recipe]
}

struct Recipe: Hashable, Codable {
    let idMeal: String
    let strMealThumb: String
    let strMeal: String
}


class ViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    func fetch() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
                //print("hi")   //debug code

                DispatchQueue.main.async {
                    self.recipes = recipeResponse.meals
                }
            } catch {
                print("Error decoding JSON data: \(error.localizedDescription)")
            }
        }.resume()
    }

    func loadImage(url: URL, completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                completion(data)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

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
