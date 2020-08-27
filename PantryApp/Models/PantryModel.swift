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
    struct Ingredient: Identifiable, Hashable {
        var name: String
        var unitPref: unitType
        var measurementMass: Measurement<Unit>?
        var measurementVol: Measurement<Unit>?
        var measurementUnit: Measurement<Unit>?
        var status: status?
        var id: UUID
        var category: String?
        var storePref: String?
        var recurring: Bool
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
        init(name: String, value: Double, unit: PantryModel.unitType, status: status, category: String, storePref: String?, recurring: Bool, expireDate: Date?, isLiked: Bool) {
            self.name = name
            switch unit {
            case .gram:
                self.measurementMass = Measurement(value: value, unit: UnitMass.grams)
                self.unitPref = PantryModel.unitType.gram
            case .kilogram:
                self.measurementMass = Measurement(value: value, unit: UnitMass.kilograms)
                self.unitPref = PantryModel.unitType.kilogram
            case .ounce:
                self.measurementMass = Measurement(value: value, unit: UnitMass.ounces)
                self.unitPref = PantryModel.unitType.ounce
            case .pound:
                self.measurementMass = Measurement(value: value, unit: UnitMass.pounds)
                self.unitPref = PantryModel.unitType.pound
            case .cup:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.cups)
                self.unitPref = PantryModel.unitType.cup
            case .liter:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.liters)
                self.unitPref = PantryModel.unitType.liter
            case .milliliter:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.milliliters)
                self.unitPref = PantryModel.unitType.cup
            case .tablespoon:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.tablespoons)
                self.unitPref = PantryModel.unitType.tablespoon
            case .teaspoon:
                self.measurementVol = Measurement(value: value, unit: UnitVolume.teaspoons)
                self.unitPref = PantryModel.unitType.teaspoon
            case .unit:
                self.measurementUnit = Measurement(value: value, unit: SingleUnit.unit)
                self.unitPref = PantryModel.unitType.unit
            }
            self.status = status
            self.id = UUID()
            self.storePref = storePref
            self.recurring = recurring
            self.expireDate = expireDate
            self.category = category
            self.isLiked = isLiked
        }
        
        init(name: String, value: String, unit: PantryModel.unitType, status: status, category: String, storePref: String?, recurring: Bool, expireDate: Date?, isLiked: Bool) {
            let valueDouble = Double(value)
            self.name = name
            switch unit {
            case .gram:
                self.measurementMass = Measurement(value: valueDouble!, unit: UnitMass.grams)
                self.unitPref = PantryModel.unitType.gram
            case .kilogram:
                self.measurementMass = Measurement(value: valueDouble!, unit: UnitMass.kilograms)
                self.unitPref = PantryModel.unitType.kilogram
            case .ounce:
                self.measurementMass = Measurement(value: valueDouble!, unit: UnitMass.ounces)
                self.unitPref = PantryModel.unitType.ounce
            case .pound:
                self.measurementMass = Measurement(value: valueDouble!, unit: UnitMass.pounds)
                self.unitPref = PantryModel.unitType.pound
            case .cup:
                self.measurementVol = Measurement(value: valueDouble!, unit: UnitVolume.cups)
                self.unitPref = PantryModel.unitType.cup
            case .liter:
                self.measurementVol = Measurement(value: valueDouble!, unit: UnitVolume.liters)
                self.unitPref = PantryModel.unitType.liter
            case .milliliter:
                self.measurementVol = Measurement(value: valueDouble!, unit: UnitVolume.milliliters)
                self.unitPref = PantryModel.unitType.cup
            case .tablespoon:
                self.measurementVol = Measurement(value: valueDouble!, unit: UnitVolume.tablespoons)
                self.unitPref = PantryModel.unitType.tablespoon
            case .teaspoon:
                self.measurementVol = Measurement(value: valueDouble!, unit: UnitVolume.teaspoons)
                self.unitPref = PantryModel.unitType.teaspoon
            case .unit:
                self.measurementUnit = Measurement(value: valueDouble!, unit: SingleUnit.unit)
                self.unitPref = PantryModel.unitType.unit
            }
            self.status = status
            self.id = UUID()
            self.storePref = storePref
            self.recurring = recurring
            self.expireDate = expireDate
            self.category = category
            self.isLiked = isLiked
        }
        
        //Used to initialize ingredients from a recipe. ONLY USE IN THE ADD RECIPE VIEW.
        init(name: String, measurementMass: Measurement<Unit>?, measurementVol: Measurement<Unit>?, measurementUnit: Measurement<Unit>?, unitPref: PantryModel.unitType) {
            self.name = name
            self.measurementMass = measurementMass
            self.measurementVol = measurementVol
            self.measurementUnit = measurementUnit
            self.id = UUID()
            self.unitPref = unitPref
            self.isRecipeIngredient = true
            self.recurring = false
            }
    }
    
    
    enum unitType: String, CaseIterable {
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
    
    
    
   
    struct Measurements {
        var value: Double
        var unit: PantryModel.unitType

        
        init(value: Double, unit: PantryModel.unitType) {
            self.value = value
            self.unit = unit
        }
        
        func unitToMeasurement(value: Double, unit: PantryModel.unitType) -> Measurement<Unit> {
            return Measurement<Unit>(value: value, unit: self.unitEnumToType(convert: unit))
        }
        
        func unitEnumToType(convert unit: PantryModel.unitType) -> Unit {
            switch(unit){
            case .gram:
                return UnitMass.grams
            case .kilogram:
                return UnitMass.kilograms
            case .pound:
                return UnitMass.pounds
            case .ounce:
                return UnitMass.ounces
            case .cup:
                return UnitVolume.cups
            case .tablespoon:
                return UnitVolume.tablespoons
            case .teaspoon:
                return UnitVolume.teaspoons
            case .liter:
                return UnitVolume.liters
            case .milliliter:
                return UnitVolume.milliliters
            case .unit:
                return SingleUnit.unit
            }
            
        }
        
        func convertVolumeToVolume(from inputMeasure: Measurement<Unit>, outputMeasure: UnitVolume) -> Measurement<Unit> {
            let inputMeasureUnitVol = Measurement<UnitVolume>(value: inputMeasure.value, unit: inputMeasure.unit as! UnitVolume)
            let outputMeasureUnitVol = inputMeasureUnitVol.converted(to: outputMeasure)
            let outputMeasureUnit = Measurement<Unit>(value: outputMeasureUnitVol.value, unit: outputMeasureUnitVol.unit)
            return outputMeasureUnit
        }
        
        func convertMassToMass(from inputMeasure: Measurement<Unit>, outputMeasure: UnitMass) -> Measurement<Unit> {
            let inputMeasureUnitMass = Measurement<UnitMass>(value: inputMeasure.value, unit: inputMeasure.unit as! UnitMass)
            let outputMeasureUnitMass = inputMeasureUnitMass.converted(to: outputMeasure)
            let outputMeasureUnit = Measurement<Unit>(value: outputMeasureUnitMass.value, unit: outputMeasureUnitMass.unit)
            return outputMeasureUnit
        }
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



