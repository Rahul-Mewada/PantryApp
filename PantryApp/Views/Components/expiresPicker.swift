//
//  expiresPicker.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//
import SwiftUI
import Foundation



struct expiresPicker: View {
    @Binding var showPicker: Bool
    @Binding var expireDate: Date
    
    var body: some View {
        
        //MARK: Date Formatting: Day, Date, Month, Year
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .full
        dateFormat.timeStyle = .none
        dateFormat.locale = Locale(identifier: "en_US")
        var dateString: String {
            dateFormat.string(from: expireDate)
        }
        
        return VStack(spacing: 5) {
            Text("Expires")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.body)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.white)
                    .frame(height: 35)
                VStack(spacing: 0) {
                    HStack {
                        Text("\(dateString)")
                            .padding()
                            .font(Font.subheadline)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(showPicker ? 90 : 0))
                            .padding()
                    }
                    .frame(height: 35)
                    .foregroundColor(Color.black)
                   
                    if showPicker {
                        
                       Divider().padding(.horizontal)
                       VStack(spacing: 0) {
                           DatePicker("Date", selection: $expireDate, displayedComponents: .date)
                           .labelsHidden()
                       }
                           .background(Color.white)
                           .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
            }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.showPicker.toggle()
                    }
            }
        }
    }
}



struct pickerView:View {
    @Binding var expireDate: Date
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color.white)
            DatePicker("Date", selection: $expireDate, displayedComponents: .date)
                .labelsHidden()
                .animation(nil)
        }
    }
}
