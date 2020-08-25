//
//  categoryPicker.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI


struct categoryPicker: View {
    @ObservedObject var viewModel: PantryViewModel
    @State var showPicker: Bool = false
    @State var showTextField: Bool = false
    @State var categoryName: String = ""
    
    @Binding var selectedCategory: String
    var title: String
    var subtitle: String
    var contents: Array<String>
    var promptToEnter: String
    var promptOnButton: String
    var addCategory: (String) -> ()
    
    init(model: PantryViewModel, select: Binding<String>, title: String, subtitle: String, contents: Array<String>, promptToEnter: String, promptOnButton: String, funcToAddCat: @escaping (String) -> ()) {
        self.viewModel = model
        self.title = title
        self._selectedCategory = select
        self.subtitle = subtitle
        self.contents = contents
        self.promptToEnter = promptToEnter
        self.promptOnButton = promptOnButton
        self.addCategory = funcToAddCat
    }
    
    // Function that selects a category and closes all pickers of this view when called.
    func selectCategory(select category: String) {
        self.selectedCategory = category
        if self.showPicker == true {
            withAnimation(.spring()) {
                self.showPicker = false
                self.showTextField = false
            }
        } else if self.showTextField == true {
            withAnimation(.spring()) {
                self.showTextField = false
            }
        }
    }
    
    
    
    var body: some View {
        VStack(spacing: 5) {
            Text("\(title)")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.body.weight(.semibold))
            ZStack {
                VStack(spacing: 0) {
                    Button(action: {
                        withAnimation(.spring()) {
                            self.showPicker.toggle()
                            self.showTextField = false
                        }
                    }) {
                        HStack {
                            Text((self.selectedCategory == "") ? "\(subtitle)" : "\(selectedCategory)")
                                .padding()
                                .font(Font.subheadline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .rotationEffect(.degrees(showPicker ? 90 : 0))
                                .padding()
                        }
                        .frame(height: 35)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                    }
                 
                    //MARK: Dropdown picker that allows the user to pick a category
                    if self.showPicker {
                        VStack(alignment: .leading) {
                            ForEach(self.contents, id: \.self) {category in
                                VStack(alignment: .leading) {
                                    Divider()
                                        .padding(.horizontal)
                                    Button(action: {
                                        self.selectCategory(select: category)
                                    }) {
                                        ZStack(alignment: .leading) {
                                            Color.white
                                            Text(category)
                                                .padding(.horizontal, 25)
                                                .foregroundColor(Color.black)
                                        }.fixedSize(horizontal: false, vertical: true)
                                    }
                                }
                            }
                            Divider()
                                .padding(.horizontal)
                            
                            //MARK: Text field that allows the user to input a new category
                            if showTextField {
                                VStack(alignment: .leading) {
                                    HStack {
                                        TextField("\(promptToEnter)", text: $categoryName, onCommit: {
                                            if self.categoryName != "" {
                                                self.addCategory(self.categoryName)
                                                self.selectCategory(select: self.categoryName)
                                                self.categoryName = ""
                                                self.showTextField = false
                                            }
                                        })
                                            .padding(.horizontal, 25)
                                            .foregroundColor(Color.gray)
                                        
                                        
                                        if self.categoryName != "" {
                                            withAnimation(.easeIn) {
                                                Button(action: {
                                                    if self.categoryName != "" {
                                                        self.addCategory(self.categoryName)
                                                        self.selectCategory(select: self.categoryName)
                                                        self.categoryName = ""
                                                        withAnimation(.spring()){
                                                            self.showTextField = false
                                                        }
                                                    }
                                                }) {
                                                    Image(systemName: "checkmark.circle.fill")
                                                        .foregroundColor(Color.green)
                                                        .font(Font.headline)
                                                        .padding(.horizontal, 10)
                                                }
                                            }
                                        }
                                        
                                        Button(action: {
                                            withAnimation(.spring()){
                                                self.showTextField = false
                                            }
                                            self.categoryName = ""
                                        }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(Color.red)
                                                .padding(.trailing)
                                                .font(Font.headline)
                                        }
                                    }
//                                    Divider()
//                                        .padding(.horizontal)
                                }
                            }
                            if !self.showTextField {
                                Button(action: {
                                    withAnimation(.spring()){
                                        self.showTextField = true
                                    }
                                }) {
                                    ZStack(alignment: .leading) {
                                        Color.white
                                        HStack {
                                            Image(systemName: "plus.circle.fill")
                                            Text("\(promptOnButton)")
                                                .font(Font.subheadline)
                                        }
                                        .foregroundColor(Color.green)
                                        .padding(.horizontal, 25)
                                    }
                                }
                            }
                        }
                            .fixedSize(horizontal: false, vertical: true)
                            .font(Font.subheadline)
                            .padding(.bottom)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
    }
}


