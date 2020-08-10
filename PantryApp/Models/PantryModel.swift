//
//  Model.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/13/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import Foundation

struct PantryModel {

    //MARK: Ingredient Struct
    struct Ingredient: Identifiable {
        var name: String
        var unitPref: unitPref
        var measurementMass: Measurement<UnitMass>?
        var measurementVol: Measurement<UnitVolume>?
        var measurementUnit: Double?
        var status: status?
        var id: UUID
        var category: String?
        var storePref: String?
        var recurring: Bool?
        var expireDate: Date?
        var isRecipeIngredient: Bool = false
        var isLiked: Bool?
        var isExpired: Bool? {
            if let expireyDate = expireDate {
                let now = Date()
                if expireyDate >= now {
                    return false
                } else {
                    return true
                }
            } else {
                return nil
            }
        }
        
        // Initialize Ingredient with mass units, i.e. 1 kg rice, 2 lbs pork shoulder, etc
        init(name: String, value: Double, unit: PantryModel.unitPref, status: status, category: String, storePref: String?, recurring: Bool?, expireDate: Date?, isLiked: Bool) {
            self.name = name
            switch unit {
            case .gram:
                self.measurementMass = Measurement(value: value, unit: UnitMass.grams)
                self.unitPref = PantryModel.unitPref.gram
            case .kilogram:
                self.measurementMass = Measurement(value: value, unit: UnitMass.kilograms)
                self.unitPref = PantryModel.unitPref.kilogram
            case .ounce:
                self.measurementMass = Measurement(value: value, unit: UnitMass.ounces)
                self.unitPref = PantryModel.unitPref.ounce
            case .pound:
                self.measurementMass = Measurement(value: value, unit: UnitMass.pounds)
                self.unitPref = PantryModel.unitPref.pound
            case .cup:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.cups)
                self.unitPref = PantryModel.unitPref.cup
            case .liter:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.liters)
                self.unitPref = PantryModel.unitPref.liter
            case .milliliter:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.milliliters)
                self.unitPref = PantryModel.unitPref.cup
            case .tablespoon:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.tablespoons)
                self.unitPref = PantryModel.unitPref.tablespoon
            case .teaspoon:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.teaspoons)
                self.unitPref = PantryModel.unitPref.teaspoon
            case .unit:
                self.measurementUnit = value
                self.unitPref = PantryModel.unitPref.unit
            }
            self.status = status
            self.id = UUID()
            self.storePref = storePref
            self.recurring = recurring
            self.expireDate = expireDate
            self.category = category
            self.isLiked = isLiked
        }
        
        // Initialize Ingredient with "unit" measurements, i.e. 1 chicken breast, 2 avocados, etc
//        init(name: String, measurement: Double, status: status, category: String, storePref: String?, recurring: Bool?, expireDate: Date?, isLiked: Bool?) {
//            self.name = name
//            self.measurementUnit = measurement
//            self.status = status
//            self.id = UUID()
//            self.storePref = storePref
//            self.recurring = recurring
//            self.expireDate = expireDate
//            self.category = category
//            self.isLiked = isLiked
//            self.unitPref = PantryModel.unitPref.unit
//        }
        
        // Initialize Ingredients with volumetric units, i.e. ml, cups, tbsp
//        init(name: String, value: Double, unit: PantryModel.unitPref, status: status, category: String, storePref: String?, recurring: Bool, expireDate: Date?, isLiked: Bool?) {
//            self.name = name
//            switch unit {
//            case .cup:
//                self.measurementVol = Measurement(value: value, unit: UnitVolume.cups)
//                self.unitPref = PantryModel.unitPref.cup
//            case .liter:
//                self.measurementVol = Measurement(value: value, unit: UnitVolume.liters)
//                self.unitPref = PantryModel.unitPref.liter
//            case .milliliter:
//                self.measurementVol = Measurement(value: value, unit: UnitVolume.milliliters)
//                self.unitPref = PantryModel.unitPref.cup
//            case .tablespoon:
//                self.measurementVol = Measurement(value: value, unit: UnitVolume.tablespoons)
//                self.unitPref = PantryModel.unitPref.tablespoon
//            case .teaspoon:
//                self.measurementVol = Measurement(value: value, unit: UnitVolume.teaspoons)
//                self.unitPref = PantryModel.unitPref.teaspoon
//            }
//            self.status = status
//            self.id = UUID()
//            self.storePref = storePref
//            self.recurring = recurring
//            self.expireDate = expireDate
//            self.category = category
//            self.isLiked = isLiked
//        }
        
        //Used to initialize ingredients from a recipe. ONLY USE IN THE ADD RECIPE VIEW.
        init(name: String, measurementMass: Measurement<UnitMass>?, measurementVol: Measurement<UnitVolume>?, measurementUnit: Double?, unitPref: PantryModel.unitPref) {
            self.name = name
            self.measurementMass = measurementMass
            self.measurementVol = measurementVol
            self.measurementUnit = measurementUnit
            self.id = UUID()
            self.unitPref = unitPref
            self.isRecipeIngredient = true
            }
    }
    
    
    enum unitPref: String, CaseIterable {
        case gram = "grams (g)"
        case kilogram = "kilograms (kg)"
        case pound = "pounds (lb)"
        case ounce = "ounces (oz)"
        case cup = "cups"
        case tablespoon = "tablespoon (tbsp)"
        case teaspoon = "teaspoons (tsp)"
        case liter = "liters (l)"
        case milliliter = "milliliters (ml)"
        case unit = "units"
    }
    
    enum status: String {
        case out = "Out"
        case low = "Low"
        case stocked = "Stocked"
        case expired = "Expired"
    }
    
    var Stores: Array<String> = ["No Preference", "Walmart", "Meijer", "Fresh Thyme", "WholeFoods", "Trader Joes"]
    var Categories: Array <String> = ["Meat", "Poultry", "Veggies", "Spices"]
    var unitsMass: Array<String> = ["grams (g)", "kilograms (kg)", "pounds (lb)", "ounces (oz)"]
    var unitsVol: Array<String> = ["cups", "tablespoon (tbsp)", "teaspoons (tsp)", "liters (l)", "milliliters (ml)"]

    enum unitMass: String {
        case gram = "grams (g)"
        case kilogram = "kilograms (kg)"
        case pound = "pounds (lb)"
        case ounce = "ounces (oz)"
    }
    
    enum unitVol: String {
        case cup = "cups"
        case tablespoon = "tablespoons (tbsp)"
        case teaspoon = "teaspoons (tsp)"
        case liter = "liters (l)"
        case milliliter = "milliliters (ml)"
    }
    
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
    
    mutating func addStore(store: String) {
        self.Stores.append(store)
    }
}



