//
//  Model.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/13/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import Foundation

struct PantryModel {
    
    //TODO:  Have different inits for Measurements<UnitMass>, Measurements<UnitVolume>
    //TODO:  Find out how to deal with stuff that are unitwise, eg: Apples, Bananas, Eggs etc
    struct Ingredient: Identifiable {
        var name: String
        var measurement: Measurement<UnitMass>
        var status: status
        var id: Int
        var category: String
        //TODO: Purchases
        //TODO: Average Repurchase time
    }
    
    enum status: String {
        case out = "Out"
        case low = "Low"
        case stocked = "Stocked"
        case expired = "Expired"
    }
    
    var Categories: Array <String> = ["Meat", "Poultry", "Veggies", "Spices"]
    
    var unitsMass: Array<String> = ["grams (g)", "kilograms (kg)", "pounds (lb)", "ounces (oz)"]
    var unitsVol: Array<String> = ["cups", "tablespoon (tbsp)", "teaspoons (tsp)", "liters (l)", "milliliters (ml)"]
    //var unitsSingle: Int = 0
    
    var ingredientsInPantry: Array<Ingredient>
    var recipesInPantry: Array<Recipe>
    
    enum recipeDifficulty: String {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }
    
    enum recipeType: String {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case snack = "Snack"
    }
    
    struct Recipe: Identifiable {
        var name: String
        var type: recipeType
        var difficulty: recipeDifficulty
        var prepTime: Measurement<UnitDuration>
        var cookTime: Measurement<UnitDuration>
        var ingredients: Array<Ingredient>
        var id: Int
        var image: String
        var servings: Int
    }
    
    mutating func addIngredientToPantry(ingredient: Ingredient) {
        self.ingredientsInPantry.append(ingredient)
    }
    
    mutating func addRecipe(recipe: Recipe) {
        self.recipesInPantry.append(recipe)
    }
    
    mutating func addCategory(category: String) {
        self.Categories.append(category)
    }
    
    
}



