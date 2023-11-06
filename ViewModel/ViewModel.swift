//
//  RecipeViewModel.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import Foundation


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
