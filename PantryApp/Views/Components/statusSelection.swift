//
//  statusSelection.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct statusSelection:View {
    @Binding var currentStatus: PantryModel.status
    
    var stockedColor: Color {
        switch self.currentStatus {
        case .stocked:
            return Color.green
        case .out, .low, .expired:
            return Color.grayBox
        }
        
    }
    var lowColor: Color {
        switch self.currentStatus{
        case .low:
            return Color.yellow
        case .stocked, .out, .expired:
            return Color.grayBox
        }
    }
    var outColor: Color {
        switch self.currentStatus{
        case.out:
            return Color.red
        case .stocked, .expired, .low:
            return Color.grayBox
        }
    }
    
    var expiredColor: Color {
        switch self.currentStatus{
        case .expired:
            return Color.red
        case .stocked, .low, .out:
            return Color.grayBox
        }
    }
    
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Status")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.body)
            HStack {
                Button(action: {
                    self.currentStatus = .stocked
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(self.stockedColor)
                            .frame(height: 35)
                        Text("Stocked").foregroundColor(Color.black)
                    }
                }

                Spacer()

                Button(action: {
                    self.currentStatus = .low
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(self.lowColor)
                            .frame(height: 35)
                        Text("Low").foregroundColor(Color.black)
                    }
                }

                Spacer()

                Button(action: {
                    self.currentStatus = .out
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(outColor)
                            .frame(height: 35)
                        Text("Out").foregroundColor(Color.black)
                    }
                }

                Spacer()

                Button(action: {
                    self.currentStatus = .expired
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(expiredColor)
                            .frame(height: 35)
                        Text("Expired").foregroundColor(Color.black)
                    }
                }
            }

        }
        .font(Font.caption)
    }
}


