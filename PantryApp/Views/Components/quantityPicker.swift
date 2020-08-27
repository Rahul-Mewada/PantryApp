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
    @Binding var unit: PantryModel.unitType
    var showTitle: Bool
    init(viewModel: PantryViewModel, value: Binding<String>, unit: Binding<PantryModel.unitType>) {
        self.viewModel = viewModel
        self._value = value
        self._unit = unit
        self.showTitle = true
    }
    
    init(viewModel: PantryViewModel, value: Binding<String>, unit: Binding<PantryModel.unitType>, showTitle: Bool) {
        self.viewModel = viewModel
        self._value = value
        self._unit = unit
        self.showTitle = showTitle
    }
    
    var body: some View {
        VStack(spacing: 5) {
            if showTitle {
                Text("Quantity")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.body.weight(.semibold))
                
            }
                HStack() {
                    Group {
                        TextField("0", text: self.$value)
                            .font(Font.subheadline)
                            .keyboardType(.decimalPad)
                            .frame(width: 50)
                    }
                    .padding(.leading)
                    Divider()
                    .frame(height: 20, alignment: .leading)
                    NavigationLink(destination: unitsView(viewModel: viewModel,  unit: $unit)) {
                        HStack {
                            Text("\(unit.rawValue)")
                                .font(Font.subheadline)
                                .padding(.leading, 10)
                                .frame(alignment: .leading)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding()
                                .frame(alignment: .trailing)
                        }.frame(maxWidth: .infinity)
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
    @Binding var unit: PantryModel.unitType
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
                    Text("Single Unit").tag(2)
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                
            VStack(alignment: .leading) {
                if typeOfUnits != 2 {
                    ForEach((typeOfUnits == 0) ? PantryModel.unitType.allCases[0...3] : PantryModel.unitType.allCases[4...8], id: \.self){ unit in
                                        VStack(alignment: .leading) {
                                            Button(action: {
                                                self.unit = unit
                                                self.presentationMode.wrappedValue.dismiss()
                                            }) {
                                                ZStack(alignment: .leading) {
                                                    Color.themeForeground
                                                    Text("\(unit.rawValue)").foregroundColor(Color.black)
                                                }
                                                .frame(height: 20)
                                            }
                                            Divider()
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal)
                                    }
                } else {
                    Button(action: {
                        self.unit = .unit
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack(alignment: .leading) {
                            Color.themeForeground
                            Text("unit").foregroundColor(Color.black)
                        }
                        .frame(height: 20)
                    }
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


