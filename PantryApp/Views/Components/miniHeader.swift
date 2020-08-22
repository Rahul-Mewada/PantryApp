//
//  miniHeader.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct miniHeader: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: "chevron.left")
            Spacer()
            Text("Ingredient Name")
            Spacer()
            Image(systemName:"heart")
        }
            .padding()
            .padding(.top)
            .background(Color.themeBackground)
            .cornerRadius(38, corners: [.topLeft, .topRight])
    }
}

struct miniHeader_Previews: PreviewProvider {
    static var previews: some View {
        miniHeader()
    }
}
