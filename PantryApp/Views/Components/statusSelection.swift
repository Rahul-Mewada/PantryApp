//
//  statusSelection.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct statusSelection:View {
//    static func == (lhs: statusSelection, rhs: statusSelection) -> Bool {
//        return lhs.currentStatus == rhs.currentStatus
//    }
    
    @ObservedObject var viewModel: PantryViewModel
    @Binding var currentStatus: PantryModel.status
    //@Binding var didChange: Bool
//    var stockedColor: Color {
//        switch self.currentStatus {
//        case .stocked:
//            return Color.green
//        case .out, .low, .expired:
//            return Color.grayBox
//        }
//
//    }
//    var lowColor: Color {
//        switch self.currentStatus{
//        case .low:
//            return Color.yellow
//        case .stocked, .out, .expired:
//            return Color.grayBox
//        }
//    }
//    var outColor: Color {
//        switch self.currentStatus{
//        case.out:
//            return Color.red
//        case .stocked, .expired, .low:
//            return Color.grayBox
//        }
//    }
//
//    var expiredColor: Color {
//        switch self.currentStatus{
//        case .expired:
//            return Color.red
//        case .stocked, .low, .out:
//            return Color.grayBox
//        }
//    }
    
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Status")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.body.weight(.semibold))
            HStack {
                Button(action: {
                    self.currentStatus = .stocked
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Box", content: "stocked"))
                            .frame(height: 35)
                        Text("Stocked")
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Text", content: "stocked"))
                    }
                }

                Spacer()

                Button(action: {
                    self.currentStatus = .low
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Box", content: "low"))
                            .frame(height: 35)
                        Text("Low")
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Text", content: "low"))
                    }
                }

                Spacer()

                Button(action: {
                    self.currentStatus = .out
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Box", content: "out"))
                            .frame(height: 35)
                        Text("Out")
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Text", content: "out"))
                    }
                }

                Spacer()

                Button(action: {
                    self.currentStatus = .expired
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Box", content: "expired"))
                            .frame(height: 35)
                        Text("Expired")
                            .foregroundColor(viewModel.returnBoxColor(from: self.currentStatus, type: "Text", content: "expired"))
                    }
                }
            }

        }
        .font(Font.caption)
    }
}


