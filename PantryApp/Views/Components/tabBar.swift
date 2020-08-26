//
//  tabBar.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/19/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct tabBar: View {
    @ObservedObject var viewModel: PantryViewModel
    var geometry: GeometryProxy
    @Binding var showAddIngredientView: Bool
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
               RoundedRectangle(cornerRadius: 5)
                .frame(width: geometry.size.width, height: geometry.size.height/11 + 10, alignment: .bottom)
                .fixedSize()
                .foregroundColor(Color.themeForeground)
                .shadow(color: Color.gray.opacity(0.2), radius: 10)

                HStack(spacing: (geometry.size.width - 10)/8) {

                                            
                    Button(action: {
                        
                    }) {
                        Image(systemName: "house")
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "archivebox")
                    }
                    
                    Circle().frame(width: geometry.size.height/10 - 20, height: geometry.size.height/10 - 20, alignment: .center).foregroundColor(Color.clear)
                    
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "book")
                    }
                    
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "person")
                    }

                }   .padding(.bottom, 10)
                    .font(Font.system(size: 21, weight: .regular))
                    .foregroundColor(Color.grayText)
                
            }
            plusCircle(geometry: geometry, showAddIngredientView: self.$showAddIngredientView)
                .frame(alignment: .center)
                
            }
            
    
       
    }
    
        
}

struct plusCircle: View {
    var geometry: GeometryProxy
    @State var showAddition: Bool = false
    @Binding var showAddIngredientView: Bool
    var body: some View {
        
        return ZStack(alignment: .bottom) {
            if showAddition {
                //Color.white
                VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height, alignment: .center)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                    .onTapGesture {
                        self.showAddition = false
                }
                
            }
            VStack(spacing: 21) {
                if showAddition == true {
                    additionalView(geometry: geometry, showAddIngredientView: self.$showAddIngredientView, showAddition: self.$showAddition)
                        .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity.animation(.easeInOut(duration: 0.3))))
                        .animation(.easeInOut)
                }
                Button (action: {
                    self.showAddition.toggle()
                }) {
                    ZStack {
                        Group {
                            Circle()
                                .frame(width: geometry.size.height/10 - 20, height: geometry.size.height/10 - 20, alignment: .bottom)
                                .foregroundColor(Color.yellow)
                            Image(systemName: "plus")
                                .font(Font.system(size: 25, weight: .bold))
                                .foregroundColor(Color.white)
                                .zIndex(0)
                                .rotationEffect((showAddition) ? .init(degrees: 45) : .init(degrees: 90))
                                .animation(.linear)
                        }
                        
                    }.padding(.bottom, 15)
                    
                }
            
            }.fixedSize()
        }
        .frame(width: geometry.size.width - 10, height: geometry.size.height, alignment: .bottom)
 }
}

struct additionalView : View {
    var geometry: GeometryProxy
    @Binding var showAddIngredientView: Bool
    @Binding var showAddition: Bool
    var body: some View {
        VStack(spacing: 10) {
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: geometry.size.width - 40, alignment: .center)
                    //.aspectRatio(1/0.4421, contentMode: .fit)
                    .foregroundColor(Color.themeBackground)
                VStack(spacing: 20) {
                    Text("Logs & Planning")
                        .padding(.top)
                        .font(Font.system(size: 18,weight: .semibold))
                    HStack() {
                        VStack(alignment:.center) {
                            NavigationLink(destination: Text("Log Food")) {
                                Circle()
                                .frame(width: 70, height: 70)
                                    .navigationBarTitle("TExt")
                            }
                            Text("Log Food")
                        }
                            .frame(width: 90, height: 95)
                            .padding(.horizontal, 10)
                            .padding(.bottom)
                            
                        VStack(alignment:.center) {
                            Circle()
                                .frame(width: 70, height: 70)
                            Text("Plan Meals")
                        }
                            .frame(width: 90, height: 95)
                            .padding(.horizontal, 10)
                            .padding(.bottom)
                        
                        VStack(alignment:.center) {
                            Circle()
                                .frame(width: 70, height: 70)
                            Text("Track Calories")
                        }
                        .frame(width: 90, height: 95)
                        .padding(.horizontal, 10)
                        .padding(.bottom)
                        
                    }
                    //.padding(.bottom)
                    .font(Font.system(size: 12))
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: geometry.size.width - 40, alignment: .center)
                    .aspectRatio(1/0.4421, contentMode: .fit)
                    .foregroundColor(Color.themeBackground)
                VStack(spacing: 20) {
                    Text("New Meals & Ingredients")
                        .padding(.top)
                        .font(Font.system(size: 18,weight: .semibold))
                    HStack() {
                        VStack(alignment:.center) {
                            Button(action: {
                                self.showAddition = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.24) {
                                    self.showAddIngredientView = true
                                }
                                
                            }) {
                                Circle()
                                .frame(width: 70, height: 70)
                            }
                            
                            Text("Add Ingredient")
                        }
                            .frame(width: 90, height: 95)
                            .padding(.horizontal, 10)
                            .padding(.bottom)
                            
                        VStack(alignment:.center) {
                            Circle()
                                .frame(width: 70, height: 70)
                            Text("Add Meal")
                        }
                            .frame(width: 90, height: 95)
                            .padding(.horizontal, 10)
                            .padding(.bottom)
                        
                        VStack(alignment:.center) {
                            Circle()
                                .frame(width: 70, height: 70)
                            Text("Find Recipes")
                        }
                        .frame(width: 90, height: 95)
                        .padding(.horizontal, 10)
                        .padding(.bottom)
                        
                    }
                    //.padding(.bottom)
                    .font(Font.system(size: 12))
                }

            }
        }
            
    }
}




struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
