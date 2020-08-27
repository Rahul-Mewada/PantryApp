//
//  AddRecipeView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/26/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var viewModel: PantryViewModel
    
    @State var recipeName: String = ""
    @State var recipeType: PantryModel.status = .stocked
    @State var acceptibleSubmission: Bool = true
    @State var isLiked: Bool = false
    @State var showPopover: Bool = false
    @State var prepTime: TimeInterval = 0
    @State var cookTime: TimeInterval = 0
    @State var showPicker: Bool = false
    @State var isPrepTime: Bool = true
    @State var ingredientName: String = ""
    @State var ingredientUnitValue: String = "0"
    @State var ingredientUnit: PantryModel.unitType = .cup
    @State var ingredientsArray: Array<PantryModel.Ingredient> = [
        PantryModel.Ingredient(name: "", value: 0, unit: .unit, status: .stocked, category: "", storePref: nil, recurring: false, expireDate: nil, isLiked: false)
    ]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var body: some View {
            return NavigationView {
                ZStack {
                    ScrollView {
                        ZStack {
                            VStack {
                                Spacer(minLength: 60).fixedSize()
                                nameTextField(ingredientName: $recipeName)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                statusSelection(viewModel: viewModel, currentStatus: $recipeType, showFull: true)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal)
                                    
                                prepAndCookTimeDisplay(prepTime: self.$prepTime, cookTime: self.$cookTime, showPicker: self.$showPicker, isPrepTime: self.$isPrepTime)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    
                                VStack {
                                    Text("Add Ingredients")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(Font.body.bold())
                                    ForEach(0..<self.ingredientsArray.count) { i in
                                        HStack {
                                            TextField("Enter the ingredient name", text: self.$ingredientsArray[i].name)
                                                .font(Font.subheadline)
                                                .padding(.vertical,5)
                                                .padding(.horizontal)
                                                .background(Color.white)
                                                .cornerRadius(5)
                                            quantityPicker(viewModel: self.viewModel,
                                                           value: ,
                                                           unit: self.$ingredientsArray[i].unit,
                                                           showTitle: false)
                                        }
                                    }
                                    Button(action: {
                                        
                                        self.ingredientsArray.append(PantryModel.Ingredient(name: "", value: 0, unit: .unit, status: .stocked, category: "", storePref: nil, recurring: false, expireDate: nil, isLiked: false))
                                    }) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add Ingredient")
                                        }
                                            .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.green)
                                    }
                                    
                                }
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                Button(action: {
                                   
                                    
                                }) {
                                ZStack() {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor((acceptibleSubmission) ? Color.blue : Color.orange)
                                        .frame(height: 35)
                                        .padding()
                                        .shadow(color: (acceptibleSubmission) ? Color.blue : Color.orange, radius: 2)
                                    Text("Continue")
                                        .foregroundColor(Color.white)
                                        .frame(alignment: .center)
                                   }
                                }
                            }
                            .background(Color.themeBackground)
                        }
                    
                    
                    }
                    .overlay(fullHeader(ingredientName: "Add Recipe", isLiked: self.$isLiked), alignment: .top)
                        .navigationBarTitle("Add Recipe", displayMode: .automatic)
                        .navigationBarItems(leading: Button(action: {
                            
                        }) {
                            Image(systemName: "chevron.left").font(.system(size: 20)).foregroundColor(Color.black)
                        }, trailing: Button(action: {
                            self.isLiked.toggle()
                        }) {
                            Image(systemName: (isLiked) ? "heart.fill" : "heart").font(.system(size: 20)).foregroundColor((isLiked) ? Color.red : Color.black)
                        })
                        .navigationBarHidden(true)
                        .background(Color.themeBackground.edgesIgnoringSafeArea(.all))
                    if showPicker {
                        hoursAndMinPicker(prepTime: self.$prepTime, cookTime: self.$cookTime, showPicker: self.$showPicker, isPrepTime: self.$isPrepTime)
                        
                    }
                }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = PantryViewModel()
        return AddRecipeView(viewModel: viewModel)
    }
}

func format(duration: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute]
    formatter.unitsStyle = .abbreviated
    formatter.maximumUnitCount = 2

    return formatter.string(from: duration)!
}
