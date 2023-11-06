//
//  RecipeDetailViewModel.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import Foundation


class RecipeDetailViewModel: ObservableObject {
    @Published var selectedMeal: [RecipeDetail]?

    func fetchMealDetails(mealID: String) {
        print("Fetching meal details for ID: \(mealID)")
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else {
            print("Invalid URL")
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("HTTP Response Code: \(response.statusCode)")
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(RecipeDetailResponse.self, from: data)
                DispatchQueue.main.async {
                    self.selectedMeal = response.meals
                }
                print("Meal ID: \(response.meals)")
            } catch {
                print("Error decoding meal details: \(error)")
            }
        }.resume()
    }

    func loadImage(url: URL, completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching image data: \(error.localizedDescription)")
            }

            if let data = data {
                completion(data)
            } else {
                print("No image data received")
                completion(nil)
            }
        }.resume()
    }
}
