//
//  AddIngredientView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI


struct AddIngredientView: View {
    
    func changeNavBarColor() {
        UINavigationBar.appearance().backgroundColor = UIColor.init(red: 241, green: 241, blue: 241)
    }
    
    @ObservedObject var viewModel: PantryViewModel
    @State var ingredientName:String = ""
    @State var showQuantityPicker: Bool = false
    @State var showExpiresPicker: Bool = false
    @State var expireDate: Date = Date()
    @State var isStocked: Bool = false
    @State var isLow: Bool = false
    @State var isOut: Bool = false
    @State var quantityValue: String = "0"
    @State var selectedCategory: String = ""
    
    
    var body: some View {
        changeNavBarColor()
        return NavigationView {
            ScrollView {
                ZStack {
                    VStack {
//                        topBar()
//                            .padding(.horizontal)
                        nameTextField(ingredientName: $ingredientName)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        quantityPicker(viewModel: viewModel, showPicker: $showQuantityPicker, value: $quantityValue)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        expiresPicker(showPicker: $showExpiresPicker, expireDate: $expireDate)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        categoryPicker(viewModel: viewModel, selectedCategory: $selectedCategory)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(height:35)
                                .foregroundColor(Color.green)
                                .shadow(color: Color.green, radius: 2)
                                .padding(.horizontal)
                                .padding(.top)
                            Text("Add Recipe").foregroundColor(Color.white)
                        }
                        //Color.themeBackground.edgesIgnoringSafeArea(.all)
                        
                    }
                    .background(Color.themeBackground)
                }
                .navigationBarTitle("Add Ingredient", displayMode: .automatic)
                .navigationBarItems(leading: Button(action: {
                    
                }) {
                    Image(systemName: "chevron.left").font(.system(size: 20)).foregroundColor(Color.black)
                }, trailing: Button(action: {
                    
                }) {
                    Image(systemName: "heart").font(.system(size: 20)).foregroundColor(Color.black)
                })
                
            }
            .background(Color.themeBackground.edgesIgnoringSafeArea(.all))
            
    }
        
        
}
}

//struct AddIngredientView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddIngredientView(viewModel: PantryViewModel())
//    }
//}
