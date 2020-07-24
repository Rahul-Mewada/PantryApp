//
//  AddIngredientsView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct AddIngredientsView: View {
    @State var ingredientName:String = ""
    @State var showQuantityPicker: Bool = false
    @State var showExpiresPicker: Bool = false
    @State var showCategoryPicker: Bool = false
    @State var date: Date = Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                VStack {
                    topBar()
                        .padding(.horizontal)

                    nameTextField(ingredientName: $ingredientName)
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    statusSelection()
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    quantityPicker()
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    expiresPicker()
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    categoryPicker()
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                    Spacer(minLength: 40)
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(height:35)
                            .foregroundColor(Color.green)
                            .shadow(color: Color.green, radius: 2)
                            .padding(.horizontal)
                        Text("Add Recipe").foregroundColor(Color.white)
                    }
                    Color.themeBackground.edgesIgnoringSafeArea(.bottom)
                    
                    }
                .navigationBarTitle("Add Ingredient")
                .navigationBarHidden(true)
                .background(Color.themeBackground)
                
                if showQuantityPicker {
                    ZStack {
                        Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                        VStack(spacing: 0) {
                            Spacer()
                            RoundedRectangle(cornerRadius: 6)
                                .frame(height: 135, alignment: .bottom)
                                .foregroundColor(Color.white)
                                .padding()
                            RoundedRectangle(cornerRadius: 6)
                                .frame(height: 35, alignment: .bottom)
                                .foregroundColor(Color.white)
                                .padding()
                        }
                    }
                    
                }
            }
            
        }
    }
    
    struct topBar: View {
        var body: some View {
            HStack(spacing: 5) {
                Button(action: {
                    
                }) {
                    Image(systemName: "chevron.left").font(.system(size: 20)).foregroundColor(Color.black)
                }
                
                Spacer(minLength: 0)
                
                Text("Add Ingredient").font(.system(size: 19.5))
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "heart").font(.system(size: 20)).foregroundColor(Color.black)
                }
            }.padding(.vertical)
        }
    }
    
    struct quantityPicker: View {
        var body: some View {
            VStack(spacing: 5) {
                Text("Quantity")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.body)
                Button(action: {
                    
                }) {
                    HStack {
                        Text("500")
                            .padding()
                            .font(Font.subheadline)
                        Divider()
                            .frame(height: 20)
                        Text("grams")
                            .padding()
                            .font(Font.subheadline)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .padding()
                    }
                    .frame(height: 35)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }

            }
                }
    }
    
    struct statusSelection:View {
        var body: some View {
            VStack(spacing: 5) {
                Text("Status")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.body)
                HStack {
                    Button(action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.gray)
                                .frame(height: 35)
                            Text("Stocked").foregroundColor(Color.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.gray)
                                .frame(height: 35)
                            Text("Low").foregroundColor(Color.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.gray)
                                .frame(height: 35)
                            Text("Out").foregroundColor(Color.black)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color.gray)
                                .frame(height: 35)
                            Text("Expired").foregroundColor(Color.black)
                        }
                    }
                }
            }
            .font(Font.caption)
        }
    }
    
    struct nameTextField: View {
        @Binding var ingredientName: String
        var body: some View {
            VStack {
                Text("Name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Enter the ingredient name", text: $ingredientName)
                    .font(Font.subheadline)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 5)
                    .background(Color.white)
                    .cornerRadius(5)
            }
        }
    }
    
    struct expiresPicker: View {
        var body: some View {
            VStack(spacing: 5) {
                Text("Expires")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.body)
                Button(action: {
                    
                }) {
                    HStack {
                        Text("Tuesday, November 1st")
                            .padding()
                            .font(Font.subheadline)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .padding()
                    }
                    .frame(height: 35)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }

            }
        }
    }
    
    struct categoryPicker: View {
        var body: some View {
            VStack(spacing: 5) {
                Text("Category")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.body)
                Button(action: {
                    
                }) {
                    HStack {
                        Text("Poultry")
                            .padding()
                            .font(Font.subheadline)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .padding()
                    }
                    .frame(height: 35)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }

            }
        }
    }
}










struct AddIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredientsView()
    }
}
