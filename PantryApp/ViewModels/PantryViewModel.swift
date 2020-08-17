//
//  PantryViewModel.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/13/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import Foundation
import SwiftUI

class PantryViewModel: ObservableObject {
    
    @Published private var pantryModel:PantryModel = createPantryModel()
    
    static func createPantryModel() -> PantryModel {
        // Declaring test Ingredients
//        var testIngredientOne = PantryModel.Ingredient(name: "Chicken", measurement: Measurement(value: 0.5, unit: UnitMass.kilograms), status: .low, id: 1, category: "Poultry")
//        var testIngredientTwo = PantryModel.Ingredient(name: "Pork", measurement: Measurement(value: 100, unit: UnitMass.grams), status: .stocked, id: 2, category: "Meat")
//        var testIngredientThree = PantryModel.Ingredient(name: "Beef", measurement: Measurement(value: 600, unit: UnitMass.grams), status: .out, id: 3, category: "Meat")
//        var testIngredientFour = PantryModel.Ingredient(name: "Eggs", measurement: Measurement(value: 0.5, unit: UnitMass.grams), status: .low, id: 4, category: "Poulty")
//        var testIngredientSeven = PantryModel.Ingredient(name: "Eggs", measurement: Measurement(value: 0.5, unit: UnitMass.grams), status: .low, id: 4, category: "Poulty")
//        var testIngredientFive = PantryModel.Ingredient(name: "Eggs", measurement: Measurement(value: 0.5, unit: UnitMass.grams), status: .low, id: 4, category: "Poulty")
//        var testIngredientSix = PantryModel.Ingredient(name: "Eggs", measurement: Measurement(value: 0.5, unit: UnitMass.grams), status: .low, id: 4, category: "Poulty")
        
        // Initializing test array of ingredients
        var testRecipeIngredients: Array<PantryModel.Ingredient> {
            [
                PantryModel.Ingredient(name: "Chicken", value: 500, unit: .gram, status: .stocked, category: "Meat", storePref: "Walmart", recurring: true, expireDate: Date(), isLiked: true),
                PantryModel.Ingredient(name: "Beef", value: 3, unit: .kilogram, status: .stocked, category: "Meat", storePref: "Walmart", recurring: true, expireDate: Date(), isLiked: true),
                PantryModel.Ingredient(name: "Corn", value: 2, unit: .unit, status: .stocked, category: "Veggies", storePref: "Walmart", recurring: true, expireDate: Date(), isLiked: true),
            ]
        }
        
        //Declaring test recipies
        var testRecipeOne: PantryModel.Recipe {
            PantryModel.Recipe(name: "Chicken Recipe", type: .dinner, difficulty: .easy, prepTime: Measurement(value: 1, unit: UnitDuration.hours), cookTime: Measurement(value: 1, unit: UnitDuration.hours), ingredients: testRecipeIngredients, id: 5, image: "chicken-recipe", servings: 1)
        }
        
        var testRecipeTwo: PantryModel.Recipe {
            PantryModel.Recipe(name: "Pork Recipe", type: .lunch, difficulty: .hard, prepTime: Measurement(value: 1, unit: UnitDuration.hours), cookTime: Measurement(value: 1, unit: UnitDuration.hours), ingredients: testRecipeIngredients, id: 6, image: "pork-recipe", servings: 2)
        }
        var testRecipeThree: PantryModel.Recipe {
            PantryModel.Recipe(name: "Beef Recipe", type: .lunch, difficulty: .medium, prepTime: Measurement(value: 1, unit: UnitDuration.hours), cookTime: Measurement(value: 1, unit: UnitDuration.hours), ingredients: testRecipeIngredients, id: 7, image:"beef-recipe", servings: 3)
        }
        var testRecipeFour: PantryModel.Recipe {
            PantryModel.Recipe(name: "Eggs Recipe", type: .breakfast, difficulty: .medium, prepTime: Measurement(value: 1, unit: UnitDuration.hours), cookTime: Measurement(value: 1, unit: UnitDuration.hours), ingredients: testRecipeIngredients, id: 8, image: "egg-recipe", servings: 8)
        }
        
        // Initializing test array of Recipies
        var testRecipeInPantry: Array<PantryModel.Recipe> {
            [
                testRecipeOne,
                testRecipeTwo,
                testRecipeThree,
                testRecipeFour
            ]
        }
        
        return PantryModel(ingredientsInPantry: testRecipeIngredients, recipesInPantry: testRecipeInPantry)
        
    }
    
    
    
    //MARK: - Accesing The Model
    var ingredientsInPantry: Array<PantryModel.Ingredient> {
        pantryModel.ingredientsInPantry
    }
    
    var recipiesInPantry: Array<PantryModel.Recipe> {
        pantryModel.recipesInPantry
    }
    
    var categoriesInPantry: Array<String> {
        pantryModel.Categories
    }
    
    var storesInPantry: Array<String> {
        pantryModel.Stores
    }
    
    
    
    //MARK: - Intents(s)
    func addIngredientsToPantry(add ingredient: PantryModel.Ingredient) {
        pantryModel.addIngredientToPantry(ingredient: ingredient)
    }
    
    func addRecipeToPantry(add recipe: PantryModel.Recipe) {
        pantryModel.addRecipe(recipe: recipe)
    }
    
    func addCategory(add category: String) {
        pantryModel.addCategory(category: category)
    }
    
    func addStore(add store: String) {
        pantryModel.addStore(store: store)
    }
    
    func returnBoxColor(from status: PantryModel.status, type: String, content: String) -> Color{
        switch status {
        case .stocked:
            if content == "stocked" {
                return (type == "Box") ? Color.greenBox :  Color.greenText
            } else {
                return (type == "Box") ? Color.grayBox :  Color.grayText
            }
        case .low:
            if content == "low" {
                return (type == "Box") ? Color.yellowBox :  Color.yellowText
            } else {
                return (type == "Box") ? Color.grayBox :  Color.grayText
            }
            
        case .out:
            if content == "out" {
                return (type == "Box") ? Color.redBox :  Color.redText
            } else {
                return (type == "Box") ? Color.grayBox :  Color.grayText
            }
            
        case .expired:
            if content == "expired" {
                return (type == "Box") ? Color.purpleBox :  Color.purpleText
            } else {
                return (type == "Box") ? Color.grayBox :  Color.grayText
            }
            
        }
    }
}
