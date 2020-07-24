//
//  TestingPicker.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/23/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct ProfileList: View {
var list: [String]

@State var displayItem: Int = -1

var body: some View {
    ZStack{
        VStack (spacing: 20){
            Text("Profile List").fontWeight(.bold)
                .padding(.bottom, 80)

            ForEach(0 ..< list.count) {number in
                Button(action: {self.displayItem = number}) { Text(self.list[number]) }
            }
        }


        if (displayItem != -1) {
            ProfileInfo(text: list[self.displayItem], displayItem: $displayItem)
                .padding(.top, -350)
        }
        Spacer()
    }.animation(.easeInOut)
  }
}

struct ProfileInfo: View {
var text: String
@Binding var displayItem:Int

var body: some View {
    ZStack(alignment: .bottom) {
        ZStack{
            Rectangle()
            .fill(Color.gray)
            .opacity(0.5)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                HStack {
                    VStack(spacing: 20) {
                        Text(text).fontWeight(.bold).padding(.all, 20)

                        Text("Name")
                        Text("Age")
                        Text("Profession")
                        Text("Interest")
                    }
                }
                .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 250, idealHeight: 100, maxHeight: 250, alignment: .top).fixedSize(horizontal: true, vertical: true)
                .background(RoundedRectangle(cornerRadius: 27).fill(Color.white.opacity(1)))
                .overlay(RoundedRectangle(cornerRadius: 27).stroke(Color.black, lineWidth: 1))
                
            }
        }.onTapGesture {
            self.displayItem = -1
        }
    }
  }
}

struct ProfileList_Previews: PreviewProvider {
static var previews: some View {
    
    ProfileList(list: ["ABC", "DEF", "GHI", "JKL", "MNO", "PQR"])
    
  }
}

