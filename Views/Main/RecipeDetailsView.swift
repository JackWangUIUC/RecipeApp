//
//  RecipeDetailsView.swift
//  recipeapp
//
//  Created by Jack Wang on 11/3/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    @StateObject var detailViewModel = RecipeDetailViewModel()
    let recipe: Recipe

    var body: some View {
        ScrollView {
            if let meals = detailViewModel.selectedMeal {
                ForEach(meals, id: \.idMeal) { meal in
                    VStack(alignment: .leading) {
                        Text("Meal Name:")
                            .font(.headline)
                            .padding()
                        Text(meal.strMeal)
                            .padding()
                        
                        Text("Instructions:")
                            .font(.headline)
                            .padding()
                        
                        Text(meal.strInstructions ?? "Error Loading")
                            .padding()

                        VStack(alignment: .leading){
                            Text("Ingredients:")
                                .font(.headline)
                                .padding(.vertical, 5)
                            
                            ForEach(1...20, id: \.self) { index in
                                if let ingredient = meal.ingredient(at: index),
                                   let measure = meal.measure(at: index) {
                                    let ingredientNumber = "\(index)."
                                    let ingredientisnul = (ingredient == "")
                                    let measureisnul = (measure == "")
                                    if ingredientisnul == false  && measureisnul == false{
                                        Text("\(ingredientNumber) \(ingredient) (\(measure))")
                                            .padding(.vertical, 5)
                                    }
                                }
                            }
                        }.padding()
                        
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Meal Details")
        .onAppear {
            detailViewModel.fetchMealDetails(mealID: recipe.idMeal)
        }
    }
}



//#Preview {
//    let sample = Recipe(idMeal: "51092", strMealThumb: "", strMeal: "gg")
//    RecipeDetailsView(recipe: sample)
//}
