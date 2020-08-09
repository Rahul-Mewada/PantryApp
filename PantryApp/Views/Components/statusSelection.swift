//
//  statusSelection.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/25/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct statusSelection:View {
    var body: some View {
        VStack(spacing: 5) {
            Text("Status")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Font.body)
            HStack {
                Button(action: {

                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.grayBox)
                            .frame(height: 35)
                        Text("Stocked").foregroundColor(Color.black)
                    }
                }

                Spacer()

                Button(action: {

                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.grayBox)
                            .frame(height: 35)
                        Text("Low").foregroundColor(Color.black)
                    }
                }

                Spacer()

                Button(action: {

                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.grayBox)
                            .frame(height: 35)
                        Text("Out").foregroundColor(Color.black)
                    }
                }

                Spacer()

                Button(action: {

                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.grayBox)
                            .frame(height: 35)
                        Text("Expired").foregroundColor(Color.black)
                    }
                }
            }

        }
        .font(Font.caption)
    }
}


