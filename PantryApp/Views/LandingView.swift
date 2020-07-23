//
//  LandingView.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct LandingView: View {
    @ObservedObject var viewModel: PantryViewModel
    @ObservedObject var viewRouter = ViewRouter()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                if self.viewRouter.currentView == "home" {
                    HomeView(viewModel: self.viewModel)
                } else if self.viewRouter.currentView == "addIngredients" {
                    AddIngredientsView()
                    Spacer()
                }
                customTab(geometry: geometry, viewRouter: self.viewRouter)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct customTab :View {
    let geometry: GeometryProxy
    @ObservedObject var viewRouter: ViewRouter
    @State private var showIngredientsModalView: Bool = false
    var body: some View{
        VStack {
            HStack {
                    Button(action: {
                        self.viewRouter.currentView = "home"
                    }) {
                        Image(systemName: "house.fill")
                        .frame(width: 24, height: 24)
                    }
                .offset(y: -geometry.safeAreaInsets.bottom/3)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.viewRouter.currentView = "home"
                    }) {
                        Image(systemName: "house.fill")
                        .frame(width: 24, height: 24)
                    }
                .offset(y: -geometry.safeAreaInsets.bottom/3)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        self.showIngredientsModalView = true
                    }) {
                        ZStack {
                            Circle()
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                        }
                    .frame(width: 42, height: 42)
                        
                    }
                .offset(y: -geometry.safeAreaInsets.bottom/3)
                .sheet(isPresented: self.$showIngredientsModalView) {
                  AddIngredientsView()
                }
                    Spacer(minLength: 0)
                    
                    Button(action: {
                    
                    }) {
                        Image(systemName: "house.fill")
                        .frame(width: 24, height: 24)
                    }
                .offset(y: -geometry.safeAreaInsets.bottom/3)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                    
                    }) {
                        Image(systemName: "house.fill")
                        .frame(width: 24, height: 24)
                    }
                .offset(y: -geometry.safeAreaInsets.bottom/3)
                }
                .padding(.horizontal, geometry.size.width/15)
                .frame(width: geometry.size.width, height: geometry.size.height/10)
                .background(Color.white.shadow(radius: 2))
            }
        }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(viewModel: PantryViewModel())
    }
}
