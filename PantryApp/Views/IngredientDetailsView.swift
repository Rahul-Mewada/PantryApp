//
//  IngredientDetailsView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI


struct IngredientDetailsView: View {
    func changeNavBarColor() {
            UINavigationBar.appearance().backgroundColor = UIColor.init(red: 241, green: 241, blue: 241)
        }
        
    @ObservedObject var viewModel: PantryViewModel
    @State var ingredientPassed: PantryModel.Ingredient
    
    @State var ingredientName:String
    
    @State var ingredientStatus: PantryModel.status
    
    @State var expireDate: Date
    @State var hasExpireDate: Bool
    
    @State var quantityValue: String
    @State var unit: PantryModel.unitType
    
    @State var selectedCategory: String
    
    @State var selectedStore: String
    @State var hasStore: Bool
    
    @State var isRecurring: Bool
    
    @State var isLiked: Bool
    
    
    var body: some View {
        //changeNavBarColor()
        return NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        statusSelection(currentStatus: $ingredientStatus)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        quantityPicker(viewModel: viewModel, value: $quantityValue, unit: $unit)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        expiresPicker(expireDate: $expireDate, hasExpire: $hasExpireDate)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        categoryPicker(model: viewModel, select: $selectedCategory, title: "Category", subtitle: "Select Category", contents: viewModel.categoriesInPantry, promptToEnter: "Enter a new category", promptOnButton: "Add a category", funcToAddCat: viewModel.addCategory)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        categoryPicker(model: viewModel, select: $selectedStore, title: "Store Preference", subtitle: "Select Store", contents: viewModel.storesInPantry, promptToEnter: "Enter a new store", promptOnButton: "Add a new store", funcToAddCat: viewModel.addStore)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        recurringPicker(isRecurring: $isRecurring)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        
                        Button(action: {
                            if self.acceptibleSubmission() == true {
                                let doubleValue:Double = Double(self.quantityValue)!
                                let ingredientToAdd: PantryModel.Ingredient = PantryModel.Ingredient(name: self.ingredientName,
                                                                                                     value: doubleValue,
                                                                                                     unit: self.unit,
                                                                                                     status: .stocked,
                                                                                                     category: self.selectedCategory,
                                                                                                     storePref: (self.hasStore) ? self.selectedStore : nil,
                                                                                                     recurring: self.isRecurring,
                                                                                                     expireDate: (self.hasExpireDate) ? self.expireDate : nil,
                                                                                                     isLiked: false)
                                self.viewModel.addIngredientsToPantry(add: ingredientToAdd)
                            }
                            
                        }) {
                        ZStack() {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor((acceptibleSubmission()) ? Color.green : Color.orange)
                                .frame(height: 35)
                                .padding()
                                .shadow(color: (acceptibleSubmission()) ? Color.green : Color.orange, radius: 2)
                            Text("Add Ingredient")
                                .foregroundColor(Color.white)
                                .frame(alignment: .center)
                           }
                        }
                    }
                    .background(Color.themeBackground)
                }
                .navigationBarTitle("Add Ingredient", displayMode: .automatic)
                .navigationBarItems(leading: Button(action: {
                    
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                }, trailing: Button(action: {
                    self.isLiked.toggle()
                }) {
                    Image(systemName: (isLiked) ? "heart.fill" : "heart")
                        .font(.system(size: 20))
                        .foregroundColor((isLiked) ? Color.red : Color.black)
                })
                
            }
            .background(Color.themeBackground.edgesIgnoringSafeArea(.all))
            
    }
        
        
}
    
    func acceptibleSubmission() -> Bool {
        var isAccetible: Bool = true
        let decimalCharacters = CharacterSet.decimalDigits
        let nameRange = self.ingredientName.rangeOfCharacter(from: decimalCharacters)
        
        if self.ingredientName == "" || nameRange != nil {
            isAccetible = false
        }
        
        if Double(quantityValue) != nil {
        } else {
            isAccetible = false
        }
        
        if selectedCategory == "" {
            isAccetible = false
        }
        
        return isAccetible
    }
}
