//
//  quantityPicker.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct quantityPicker: View {
    @ObservedObject var viewModel: PantryViewModel
    @State var showPicker: Bool = false
    @Binding var value: String
    @State var unitString: String = "grams (g)"
    
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Quantity")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.body)
                HStack() {
                    TextField("0", text: self.$value)
                        .padding()
                        .font(Font.subheadline)
                        .keyboardType(.decimalPad)
                        .frame(width: 60)
                    Divider()
                        .frame(height: 20)
                    NavigationLink(destination: unitsView(viewModel: viewModel, unitString: self.$unitString)) {
                        HStack {
                            Text("\(unitString)")
                                .font(Font.subheadline)
                                .padding(.leading, 10)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding()
                        }
                    }

                }
                .frame(height: 35)
                .foregroundColor(Color.black)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}

struct unitsView: View {
    @ObservedObject var viewModel: PantryViewModel
    @State var typeOfUnits: Int = 0
    @Binding var unitString: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 1)
                .foregroundColor(Color.themeBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Picker(selection: $typeOfUnits, label: Text("Select the unit type")) {
                    Text("Mass").tag(0)
                    Text("Volume").tag(1)
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                
            VStack(alignment: .leading) {
                ForEach((typeOfUnits == 0) ? viewModel.unitsMass : viewModel.unitsVol, id: \.self){ unit in
                    VStack(alignment: .leading) {
                        Button(action: {
                            self.unitString = unit
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            ZStack(alignment: .leading) {
                                Color.themeForeground
                                Text("\(unit)").foregroundColor(Color.black)
                            }
                            .frame(height: 20)
                        }
                        
                        if unit != ((self.typeOfUnits == 0) ? self.viewModel.unitsMass.last : self.viewModel.unitsVol.last){
                            Divider()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
                .padding()
                .background(Color.themeForeground)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
                
        }
            
    }
            .navigationBarTitle("Choose Units")
            .navigationBarHidden(false)
            .background(Color.themeBackground.edgesIgnoringSafeArea(.all), alignment: .topLeading)
            
    }
}


