//
//  prepAndCookTimeDisplay.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/26/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct prepAndCookTimeDisplay: View {
    @Binding var prepTime: TimeInterval
    @Binding var cookTime: TimeInterval
    @Binding var showPicker: Bool
    @Binding var isPrepTime: Bool
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                .frame(height: 124)
                .foregroundColor(Color.white)
                VStack {
                   Text("Prep Time")
                        .font(Font.system(size: 18).weight(.semibold))
                        .foregroundColor(Color.black)
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .frame(width: 88.46, height: 36)
                            .foregroundColor(Color.themeBackground)
                        Text(format(duration: self.prepTime))
                            .font(Font.system(size: 20))
                    }
                   
                }
            }
                .onTapGesture {
                    self.showPicker.toggle()
                    self.isPrepTime = true
                }
            
            Spacer(minLength: 40)
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .frame(height: 124)
                    .foregroundColor(Color.white)
                VStack {
                   Text("Cook Time")
                        .font(Font.system(size: 18).weight(.semibold))
                        .foregroundColor(Color.black)
                   ZStack {
                       RoundedRectangle(cornerRadius: 6)
                           .frame(width: 88.46, height: 36)
                           .foregroundColor(Color.themeBackground)
                       Text(format(duration: self.cookTime))
                           .font(Font.system(size: 20))
                   }
                }
            }
                .onTapGesture {
                    self.showPicker.toggle()
                    self.isPrepTime = false
                }
        }
    }
}


