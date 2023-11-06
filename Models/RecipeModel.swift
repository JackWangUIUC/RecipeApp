//
//  RecipeModel.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import Foundation


struct RecipeResponse: Codable {
    let meals: [Recipe]
}

struct Recipe: Hashable, Codable {
    let idMeal: String
    let strMealThumb: String
    let strMeal: String
}
