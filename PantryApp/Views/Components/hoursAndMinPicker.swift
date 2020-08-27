//
//  hoursAndMinPicker.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/26/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct hoursAndMinPicker: View {
    @Binding var prepTime: TimeInterval
    @Binding var cookTime: TimeInterval
    @Binding var showPicker: Bool
    @Binding var isPrepTime: Bool
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .transition(.opacity)
                .onTapGesture {
                    self.showPicker = false
            }
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 14).foregroundColor(Color.themeForeground)
                VStack(spacing: 0) {
                    Text((isPrepTime) ? "Pick Prep Time" : "Pick Cook Time")
                        .padding(.top)
                        .font(Font.system(size: 18)
                        .weight(.semibold))
                        .foregroundColor(Color.black)
                    
                    if isPrepTime {
                        DurationPicker(duration: $prepTime)
                        Button(action: {
                            self.prepTime = 0
                            self.showPicker = false
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color.grayBox)
                                Text("No Prep Time")
                                        .foregroundColor(Color.black)
                                        .padding(10)
                            }
                                .frame(height: 35)
                                .padding()
                        }
                        
                    } else {
                        DurationPicker(duration: $cookTime)
                        Button(action: {
                            self.cookTime = 0
                            self.showPicker = false
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundColor(Color.grayBox)
                                    
                                Text("No Cook Time")
                                        .foregroundColor(Color.black)
                                        .padding(10)
                            }
                                .frame(height: 35)
                                .padding()
                        }
                    }
                    
                }
                    .labelsHidden()
            }
                .frame(height: 300, alignment: .bottom)
                .edgesIgnoringSafeArea(.all)
                .padding(.horizontal)
                .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity.animation(.easeInOut(duration: 0.3))))
                .animation(.easeInOut)
        }
        
    }
}

