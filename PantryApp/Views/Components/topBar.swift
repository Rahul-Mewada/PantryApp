//
//  topBar.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct topBar: View {
    var body: some View {
        HStack(spacing: 5) {
            Button(action: {
                
            }) {
                Image(systemName: "chevron.left").font(.system(size: 20)).foregroundColor(Color.black)
            }
            
            Spacer()

            
            Button(action: {
                
            }) {
                Image(systemName: "heart").font(.system(size: 20)).foregroundColor(Color.black)
            }
        }
    }
}

