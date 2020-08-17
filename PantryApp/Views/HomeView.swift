//
//  ContentView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/13/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI


struct HomeView: View {
    @ObservedObject var viewModel: PantryViewModel
    var body: some View {
        GeometryReader { screenGeometry in
            ZStack {
                Color.yellow
                    .edgesIgnoringSafeArea(.all)
                ZStack(alignment: .bottom) {
                        ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 0) {
                                    homeHelloView()
                                        .padding()
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(alignment: .top) {
                                            ForEach(self.viewModel.recipiesInPantry) { recipe  in
                                                recipePantryView(recipe: recipe)
                                            }
                                            ZStack() {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .foregroundColor(Color.gray.opacity(0.4))
                                                    .shadow(color: Color.gray.opacity(0.4), radius: 5)
                                                VStack(spacing: 0) {
                                                    Image(systemName: "plus.circle.fill").font(.largeTitle)
                                                        .padding()
                                                    Text("Add Recipe")
                                                        .font(Font.callout)
                                                }
                                            }
                                                .padding(.leading)
                                                .frame(height: UIScreen.main.bounds.size.height/3.515)
                                                .aspectRatio(1/1.38, contentMode: .fit)
                                            
                                        }
                                        .padding(.top, 7)
                                        .padding(.bottom)
                                    }
                                    ScrollView(.horizontal, showsIndicators: false ) {
                                        HStack(spacing: 23) {
                                            Text("All Categories")
                                                .fontWeight(.bold)
                                            ForEach(self.viewModel.categoriesInPantry, id:  \.self) {category in
                                                Text("\(category)")
                                            }
                                        }.padding(.horizontal)
                                    }
                                    Spacer(minLength: 20)
                                    VStack(spacing: 0) {
                                        Spacer(minLength: 10)
                                        ForEach(self.viewModel.ingredientsInPantry) { ingredient in
                                            ingredientPantryView(viewModel: self.viewModel, ingredient: ingredient)
                                                .padding(.vertical, 3)
                                                .padding(.horizontal)
                                        }
                                    }
                                    .background(Color.themeForeground)
                                .clipShape(RoundedRectangle(cornerRadius: 7))
                                    .padding(.horizontal)
                                    
                                }
                                .padding(.top, screenGeometry.safeAreaInsets.top)
                                
                            
                        }
                        .background(Color.themeBackground.edgesIgnoringSafeArea(.all))
                        .clipShape(RoundedRectangle(cornerRadius: 33))
                        
                    }
                    .padding(.top, screenGeometry.safeAreaInsets.top)
                    .padding(.bottom, 5)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: screenGeometry.size.width - 10, height: screenGeometry.size.height)
                    
                
            }
        }
        
    }
}


//MARK:- Horizontal Recipe Card View Component
struct recipePantryView: View {
    let recipe: PantryModel.Recipe
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.themeForeground)
                //.shadow(color: Color.gray.opacity(0.4), radius: 5)
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Image("\(recipe.image)")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .clipped()
                        .padding(9)
                        .blur(radius: 4, opaque: false)
                    Image("\(recipe.image)")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .clipped()
                        .padding(10)
                        .padding(.bottom, 5)
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text(recipe.name)
                        .font(Font.callout)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    Text("1 hour 20 mins")
                        .font(Font.caption)
                        .fontWeight(.light)
                        .lineLimit(1)
                }
                .padding(.leading, 10)
                .padding(.bottom, 15)
                

            }
                .lineLimit(2)
        }
            .frame(height: UIScreen.main.bounds.size.height/3.515)
            .aspectRatio(1/1.38, contentMode: .fit)
            .padding(.leading)

    }
}

//MARK:- Veritcal Ingredient View
struct ingredientPantryView :View {
    @ObservedObject var viewModel: PantryViewModel
    @State var ingredient: PantryModel.Ingredient
    
    var body: some View {
        NavigationLink(destination: IngredientDetailsView(viewModel: self.viewModel,
                                                          ingredientPassed: self.ingredient,
                                                          ingredientName: self.ingredient.name,
                                                          ingredientStatus: self.ingredient.status ?? .stocked,
                                                          expireDate: self.ingredient.expireDate ?? Date(),
                                                          hasExpireDate: (self.ingredient.expireDate != nil) ? true : false,
                                                          quantityValue: String(0),
                                                          unit: .cup,
                                                          selectedCategory: self.ingredient.category ?? "",
                                                          selectedStore: self.ingredient.storePref ?? "No Prefence",
                                                          hasStore: (self.ingredient.storePref != nil) ? true : false,
                                                          isRecurring: self.ingredient.recurring,
                                                          isLiked: self.ingredient.isLiked ?? false)) {
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
        if let unwrappedMeasurement = ingredient.measurementUnit?.value {
            return Text("\(unwrappedMeasurement, specifier: "%.0f") units")
        } else {
            return Text("")
        }
    }
}
