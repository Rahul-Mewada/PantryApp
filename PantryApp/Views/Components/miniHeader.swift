//
//  miniHeader.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct miniHeader: View {
    @Binding var ingredientName: String
    @Binding var isLiked: Bool
    
    var body: some View {
        HStack(alignment: .bottom) {
            Button(action: {
                
            }) {
                Image(systemName: "chevron.left").foregroundColor(Color.black)
            }
            Spacer()
            Text("\(ingredientName)")
            Spacer()
            
            Button(action: {
                self.isLiked.toggle()
            }) {
                Image(systemName: (isLiked) ? "heart.fill" : "heart").foregroundColor((isLiked) ? Color.red : Color.black)
            }
        }
            .font(Font.system(size: 20).weight(.bold))
            .padding()
            .padding(.top)
            .background(Color.themeBackground)
            .cornerRadius(38, corners: [.topLeft, .topRight])
    }
}

