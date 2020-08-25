//
//  nameTextField.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct nameTextField: View {
    @Binding var ingredientName: String
    var body: some View {
        VStack {
            Text("Name")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.body.weight(.semibold))
            TextField("Enter the ingredient name", text: $ingredientName)
                .font(Font.subheadline)
                .padding(.vertical,5)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(5)
        }
    }
}
