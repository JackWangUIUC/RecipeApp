//
//  RecipeDetailsModel.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import Foundation



struct RecipeDetailResponse: Codable {
    let meals: [RecipeDetail]

    
}

struct RecipeDetail: Hashable, Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

extension RecipeDetail {
    func ingredient(at index: Int) -> String? {
        switch index {
        case 1: return strIngredient1
        case 2: return strIngredient2
        case 3: return strIngredient3
        case 4: return strIngredient4
        case 5: return strIngredient5
        case 6: return strIngredient6
        case 7: return strIngredient7
        case 8: return strIngredient8
        case 9: return strIngredient9
        case 10: return strIngredient10
        case 11: return strIngredient11
        case 12: return strIngredient12
        case 13: return strIngredient13
        case 14: return strIngredient14
        case 15: return strIngredient15
        case 16: return strIngredient16
        case 17: return strIngredient17
        case 18: return strIngredient18
        case 19: return strIngredient19
        case 20: return strIngredient20
        default: return nil
        }
    }

    func measure(at index: Int) -> String? {
        switch index {
        case 1: return strMeasure1
        case 2: return strMeasure2
        case 3: return strMeasure3
        case 4: return strIngredient4
        case 5: return strIngredient5
        case 6: return strIngredient6
        case 7: return strIngredient7
        case 8: return strIngredient8
        case 9: return strIngredient9
        case 10: return strIngredient10
        case 11: return strIngredient11
        case 12: return strIngredient12
        case 13: return strIngredient13
        case 14: return strIngredient14
        case 15: return strIngredient15
        case 16: return strIngredient16
        case 17: return strIngredient17
        case 18: return strIngredient18
        case 19: return strIngredient19
        case 20: return strIngredient20
        default: return nil
        }
    }
}
