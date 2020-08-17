//
//  homeHelloView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/16/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct homeHelloView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 20) {
            HStack {
                Image(systemName: "person.circle.fill")
                Spacer()
                Image(systemName: "plus.circle.fill")
            }.font(Font.largeTitle)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Good Evening")
                    .font(Font.title)
                    .fontWeight(.bold)
                Text("Here are some recipes you can cook right now")
                    .fontWeight(.light)
            }
        }
    }
}

struct homeHelloView_Previews: PreviewProvider {
    static var previews: some View {
        homeHelloView()
    }
}
