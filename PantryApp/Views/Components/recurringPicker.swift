//
//  recurringPicker.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/10/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct recurringPicker: View {
    @Binding var isRecurring: Bool
    var body: some View {
        VStack(spacing: 5) {
            Text("Add to SmartList when low")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.body)
            ZStack {
                Color.themeForeground
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .frame(height: 40)
                Toggle("Recurrance", isOn: $isRecurring)
                    .font(Font.subheadline)
                    .padding(.horizontal)
                
            }
        }
    }
}

