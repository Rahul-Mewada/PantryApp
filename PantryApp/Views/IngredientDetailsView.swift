//
//  IngredientDetailsView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//
import SwiftUI


struct IngredientDetailsView: View {

        
    @ObservedObject var viewModel: PantryViewModel
    var ingredientPassed: Binding<PantryModel.Ingredient>
    
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
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment:.bottom) {
                    RoundedRectangle(cornerRadius: 38)
                        .foregroundColor(Color.themeBackground)
                        .overlay(innerIngredientView(viewModel: self.viewModel,
                                                     ingredientPassed: self.ingredientPassed,
                                                     ingredientName: self.$ingredientName,
                                                     ingredientStatus: self.$ingredientStatus,
                                                     expireDate: self.$expireDate,
                                                     hasExpireDate: self.$hasExpireDate,
                                                     quantityValue: self.$quantityValue,
                                                     unit: self.$unit,
                                                     selectedCategory: self.$selectedCategory,
                                                     selectedStore: self.$selectedStore,
                                                     hasStore: self.$hasStore,
                                                     isRecurring: self.$isRecurring,
                                                     isLiked: self.$isLiked,
                                                     geometry: geometry)
                            .edgesIgnoringSafeArea(.all)
                            .padding(.top)
                            .clipped()
                            .cornerRadius(38)
                            .overlay(miniHeader(ingredientName: self.$ingredientName, isLiked: self.$isLiked)
                                    .clipped(), alignment: .top)//.cornerRadius(38)
                            
                        )
                        
                        .padding(.horizontal, 5)
                        .padding(.bottom, 5)
                        .edgesIgnoringSafeArea(.bottom)
                       
                    
                        
                }
                    
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                
                
                
                    
            }.background(Color.yellow.edgesIgnoringSafeArea(.all))
            
        }
    }

}

struct innerIngredientView: View {
    @ObservedObject var viewModel: PantryViewModel
    @Binding var ingredientPassed: PantryModel.Ingredient
    
    @Binding var ingredientName:String
        
    @Binding var ingredientStatus: PantryModel.status

    @Binding var expireDate: Date
    @Binding var hasExpireDate: Bool
    
    @Binding var quantityValue: String

    @Binding var unit: PantryModel.unitType
    
    @Binding var selectedCategory: String

    @Binding var selectedStore: String

    @Binding var hasStore: Bool
    
    @Binding var isRecurring: Bool
    
    @Binding var isLiked: Bool
    
    var geometry: GeometryProxy
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    statusSelection(viewModel: self.viewModel, currentStatus: self.$ingredientStatus)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    quantityPicker(viewModel: self.viewModel, value: self.$quantityValue, unit: self.$unit)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    expiresPicker(expireDate: self.$expireDate, hasExpire: self.$hasExpireDate)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    categoryPicker(model: self.viewModel, select: self.$selectedCategory, title: "Category", subtitle: "Select Category", contents: self.viewModel.categoriesInPantry, promptToEnter: "Enter a new category", promptOnButton: "Add a category", funcToAddCat: self.viewModel.addCategory)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    categoryPicker(model: self.viewModel, select: self.$selectedStore, title: "Store Preference", subtitle: "Select Store", contents: self.viewModel.storesInPantry, promptToEnter: "Enter a new store", promptOnButton: "Add a new store", funcToAddCat: self.viewModel.addStore)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    recurringPicker(isRecurring: self.$isRecurring)
                        .padding(.vertical, 5)
                        .padding(.horizontal)

                    
                    Button(action: {
                        if self.acceptibleSubmission() == true {
                            let originalID = self.ingredientPassed.id
                            let doubleValue:Double = Double(self.quantityValue)!
                            let ingredientToEdit: PantryModel.Ingredient = PantryModel.Ingredient(name: self.ingredientName,
                                                                                                 value: doubleValue,
                                                                                                 unit: self.unit,
                                                                                                 status: self.ingredientStatus,
                                                                                                 category: self.selectedCategory,
                                                                                                 storePref: (self.hasStore) ? self.selectedStore : nil,
                                                                                                 recurring: self.isRecurring,
                                                                                                 expireDate: (self.hasExpireDate) ? self.expireDate : nil,
                                                                                                 isLiked: false)
                            self.ingredientPassed = ingredientToEdit
                            self.ingredientPassed.id = originalID
                            print("Ingredient Edited: \(self.ingredientPassed)")
                            //self.viewModel.addIngredientsToPantry(add: ingredientToEdit)
                        }
                        
                    }) {
                    ZStack() {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor((self.acceptibleSubmission()) ? Color.green : Color.orange)
                            .frame(height: 35)
                            .padding()
                            .shadow(color: (self.acceptibleSubmission()) ? Color.green : Color.orange, radius: 2)
                        Text("Submit Changes")
                            .foregroundColor(Color.white)
                            .frame(alignment: .center)
                            .font(Font.body.weight(.bold))
                       }
                    }
                }
                }
            //.padding(.top, 150)
                .padding(.top, geometry.safeAreaInsets.top)
                .padding(.bottom, geometry.size.height/10)
                
        }
        .padding(.top)
        .edgesIgnoringSafeArea(.all)
            
            
            .background(Color.themeBackground.edgesIgnoringSafeArea(.all))
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
