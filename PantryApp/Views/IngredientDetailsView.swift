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
    var ingredient: PantryModel.Ingredient
    @State var ingredientName:String = ""
    @State var showQuantityPicker: Bool = false
    @State var showExpiresPicker: Bool = false
    @State var showCategoryPicker: Bool = false
    @State var expireDate: Date = Date()
    @State var hasExpire: Bool = true
    @State var isStocked: Bool = false
    @State var isLow: Bool = false
    @State var isOut: Bool = false
    @State var quantityValue:Double = 0
    @State var selectedCategory: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    topBar()
                        .padding(.horizontal)
//                    nameTextField(ingredientName: $ingredientName)
//                        .padding(.vertical, 5)
//                        .padding(.horizontal)
                    statusSelection()
                        .padding(.vertical, 5)
                        .padding(.horizontal)
//                    quantityPicker(showPicker: $showQuantityPicker, value: $quantityValue)
//                        .padding(.vertical, 5)
//                        .padding(.horizontal)
                    expiresPicker(expireDate: $expireDate, hasExpire: $hasExpire)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
//                    categoryPicker(viewModel: viewModel, selectedCategory: $selectedCategory)
//                        .padding(.vertical, 5)
//                        .padding(.horizontal)
                    Spacer(minLength: 40)
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height:35)
                            .foregroundColor(Color.green)
                            .shadow(color: Color.green, radius: 2)
                            .padding(.horizontal)
                        Text("Add Recipe").foregroundColor(Color.white)
                    }
                    Color.themeBackground.edgesIgnoringSafeArea(.all)
                    
                    }
                .navigationBarTitle("Add Ingredient")
                .navigationBarHidden(true)
                .background(Color.themeBackground)
                
                if showExpiresPicker {
                    ZStack {
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                            self.showExpiresPicker = false
                        }
                        VStack(spacing: 0) {
                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .frame(height: 230, alignment: .bottom)
                                .foregroundColor(Color.white)
                                .padding()
                                VStack(spacing: 0) {
                                    Text("Select Expire Date")
                                    //DatePicker("Date", selection: $expireDate, displayedComponents: .date)
                                    .labelsHidden()
                                }
                                .scaledToFit()
                                
                            }
                            Button(action: {
                                self.showExpiresPicker = false
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 6)
                                    .frame(height: 35, alignment: .bottom)
                                    .foregroundColor(Color.white)
                                    Text("Done").padding()
                                }
                                .padding(.bottom)
                                .padding(.horizontal)
                            }
                            
                        }
                    }
                    
                    
                }
            }
            
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    










//struct AddIngredientsView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        IngredientDetailsView(viewModel: PantryViewModel())
//    }
//}
