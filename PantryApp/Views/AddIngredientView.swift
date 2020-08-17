//
//  AddIngredientView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI


struct AddIngredientView: View {
    
//    func changeNavBarColor() {
//       UINavigationBar.appearance().backgroundColor = UIColor.init(red: 241, green: 241, blue: 241)
//    }
    
    @ObservedObject var viewModel: PantryViewModel
    
    @State var ingredientName:String = ""
    
    @State var expireDate: Date = Date()
    @State var hasExpireDate: Bool = true
    
    @State var quantityValue: String = "0"
    @State var unit: PantryModel.unitType = .gram
    
    @State var selectedCategory: String = ""
    
    @State var selectedStore: String = "No Preference"
    @State var hasStore: Bool = true
    
    @State var passedIngredientNameField: Bool = true
    @State var passedValueField: Bool = true
    @State var passedCategoryField: Bool = true
    
    @State var isRecurring: Bool = true
    
    @State var isLiked: Bool = false
    
    var body: some View {
        //changeNavBarColor()
        return NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        nameTextField(ingredientName: $ingredientName)
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
                        
                        //Color.themeBackground.edgesIgnoringSafeArea(.all)
                        
                    }
                    .background(Color.themeBackground)
                }
                
                
            }
            .navigationBarTitle("Add Ingredient", displayMode: .large)
            .navigationBarItems(leading: Button(action: {
                
            }) {
                Image(systemName: "chevron.left").font(.system(size: 20)).foregroundColor(Color.black)
            }, trailing: Button(action: {
                self.isLiked.toggle()
            }) {
                Image(systemName: (isLiked) ? "heart.fill" : "heart").font(.system(size: 20)).foregroundColor((isLiked) ? Color.red : Color.black)
            })
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

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredientView(viewModel: PantryViewModel())
    }
}
