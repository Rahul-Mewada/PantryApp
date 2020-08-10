//
//  ContentView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/13/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//




//TODO - status of ingredients and difficulty of recipies need to be colored accordingly
//TODO - Font resizing. They seem too big

import SwiftUI


struct HomeView: View {
    @ObservedObject var viewModel: PantryViewModel
    var body: some View {
        
        
        NavigationView {
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 1).foregroundColor(Color.themeBackground).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Hello James").font(Font.title).padding()
                    Text("Welcome to Pantry. This is going to make a million bucks.").padding(.horizontal)
                    
                    ScrollView(.vertical) {
                        //MARK: - Recipe View
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(viewModel.recipiesInPantry) { recipe in
                                    recipePantryView(recipe: recipe)
                                }
                            }
                        }
                            .frame(height: 250)
                        
                        //MARK: - Category Scroll View
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 1).foregroundColor(Color.themeBackground)
                                    .frame(maxWidth: .infinity, maxHeight: 35)
                                HStack(alignment: .lastTextBaseline, spacing: 24){
                                    Text("All Items").font(.system(size: 24))
                                    Text("Fridge")
                                    Text("Dry Pantry")
                                    Text("Freezer")
                                    Text("Trash")
                                }
                            }
                            
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        }
                        
                        //MARK: - Ingredient List View
                        ZStack {
                            RoundedRectangle(cornerRadius: 20).foregroundColor(Color.themeForeground)
                            VStack {
                                ForEach(viewModel.ingredientsInPantry) {ingredient in
                                    ingredientPantryView(viewModel:self.viewModel, ingredient: ingredient)
                                }
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                    }
                }
               
            }
        
        }
        .font(.system(size: 15))
        .edgesIgnoringSafeArea(.top)
    }
}


//MARK:- Horizontal Recipe Card View Component
struct recipePantryView: View {
    let recipe: PantryModel.Recipe
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 20).frame(width:166.5, height:231 )
                .foregroundColor(Color.themeForeground)
                //.shadow(radius: 5)
            VStack(alignment: .leading) {
                Image("\(recipe.image)")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .clipped()
                    .padding(.leading, 6)
                    .padding(.trailing, 6)
                    .padding(.top, 6)
                    //.shadow(radius: 5)
                Text(recipe.name).lineLimit(1)
                    .padding(.leading)
                Text(recipe.difficulty.rawValue)
                    .lineLimit(1)
                    .padding(.leading)
                    .padding(.bottom, 6)
            }
                .lineLimit(2)
        }
            .frame(width: 170)
            .padding()
    }
}

//MARK:- Veritcal Ingredient View
struct ingredientPantryView :View {
    @ObservedObject var viewModel: PantryViewModel
    var ingredient: PantryModel.Ingredient
    var body: some View {
        NavigationLink(destination: IngredientDetailsView(viewModel: self.viewModel, ingredient: self.ingredient)) {
            VStack {
                HStack {
                 VStack(alignment: .leading) {
                     Text("\(ingredient.name)")
                     Text("\(ingredient.status?.rawValue ?? "")")
                 }
                 Spacer()
                 VStack(alignment: .trailing) {
                    returnMeasurement(ingredient: ingredient)
                    Text("\(ingredient.category ?? "")")
                
                    }
                    Image(systemName: "chevron.right")
                        .padding(.leading, 10)
                        .font(Font.body)
                 }
                Divider()
            }
            .foregroundColor(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let baseView = PantryViewModel()
        return HomeView(viewModel: baseView)
        
    }
}


func returnMeasurement(ingredient: PantryModel.Ingredient) -> some View {
    switch ingredient.unitPref {
    case .cup, .liter, .milliliter, .tablespoon, .teaspoon:
        if let unwrappedMeasurement = ingredient.measurementVol {
            return Text("\(unwrappedMeasurement.value, specifier: "%.1f") \(unwrappedMeasurement.unit.symbol)")
        } else {
            print("Error in unwrapping ingredient.measurementVol")
            return Text("")
        }
    case .gram, .kilogram, .ounce, .pound:
        if let unwrappedMeasurement = ingredient.measurementMass {
            return Text("\(unwrappedMeasurement.value, specifier: "%.1f") \(unwrappedMeasurement.unit.symbol)")
        } else {
            print("Error in unwrapping ingredient.measurementVol")
            return Text("")
        }
    case .unit:
        if let unwrappedMeasurement = ingredient.measurementUnit {
            return Text("\(unwrappedMeasurement, specifier: "%.0f") units")
        } else {
            return Text("")
        }
    }
}
