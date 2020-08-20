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
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    landingView(viewModel: self.viewModel)
                    
//                    RoundedRectangle(cornerRadius: 5)
//                        .edgesIgnoringSafeArea(.bottom)
//                        .frame(width: geometry.size.width - 10, height: geometry.size.height/11, alignment: .bottom)
//                        .edgesIgnoringSafeArea(.bottom)
                    tabBar(geometry: geometry)
                        .edgesIgnoringSafeArea(.bottom)
                    
                    
                }
                    .clipShape(RoundedRectangle(cornerRadius: 38))
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                    .edgesIgnoringSafeArea(.bottom)
                    .background(Color.yellow.edgesIgnoringSafeArea(.all))

        .navigationBarTitle("")
        .navigationBarHidden(true)
        }
    }
  }
}

struct landingView: View {
    @ObservedObject var viewModel: PantryViewModel
    var body: some View {
        GeometryReader { screenGeometry in

                            ZStack {
                                ScrollView(.vertical, showsIndicators: false) {
                                        VStack(spacing: 0) {
                                            
                    //MARK: Welcome View
                                            homeHelloView()
                                                .padding()
                                            
                    //MARK: Recipe Scroll View
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
                                            }
                                            Spacer(minLength: 20)
                    //MARK: Categories Scroll View
                                            ScrollView(.horizontal, showsIndicators: false ) {
                                                HStack(spacing: 23) {
                                                    Text("All Categories")
                                                        .fontWeight(.semibold)
                                                    ForEach(self.viewModel.categoriesInPantry, id:  \.self) {category in
                                                        Text("\(category)")
                                                    }
                                                }.padding(.horizontal)
                                            }
                                            Spacer(minLength: 10)
                                            
                    //MARK: Ingredients View
                                            VStack(spacing: 0) {
                                                //Spacer(minLength: 10)
                                                ForEach(self.viewModel.ingredientsInPantry) { ingredient in
                                                    ingredientPantryView(viewModel: self.viewModel, ingredient: ingredient)
        //                                                .padding(.vertical, 3)
        //                                                .padding(.horizontal)
                                                }
                                            }
                                            .background(Color.themeForeground)
                                            .clipShape(RoundedRectangle(cornerRadius: 7))
                                            .padding(.horizontal)
                                            
                                        }
                                        .padding(.top, screenGeometry.safeAreaInsets.top)
                                        
                                    
                                }
                                    .background(Color.themeBackground.edgesIgnoringSafeArea(.all))
                                
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
                        .blur(radius: 5, opaque: false)
                        .opacity(0.4)
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
            isLiked: self.ingredient.isLiked ?? false).navigationBarTitle("").navigationBarHidden(true)) {
                
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text("\(ingredient.name)").fontWeight(.semibold)
                        Text("\(ingredient.status?.rawValue ?? "")").font(Font.caption)
                 }
                 Spacer()
                    VStack(alignment: .trailing, spacing: 3) {
                    returnMeasurement(ingredient: ingredient).font(.custom("FONT_NAME", size: 14))
                        Text("\(ingredient.category ?? "")").font(.custom("FONT_NAME", size: 10)).foregroundColor(Color.grayText)

                    }
                    Image(systemName: "chevron.right")
                        .padding(.leading, 10)
                        .font(Font.body)
                        .foregroundColor(Color.grayText)
                }
                .font(Font.callout)
                .padding(10)
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
