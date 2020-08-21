//
//  tabBar.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/19/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct tabBar: View {
    var geometry: GeometryProxy
    
    var body: some View {
            ZStack(alignment: .bottom) {
                ZStack {
                   RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width - 10, height: geometry.size.height/11 + 10, alignment: .bottom)
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

                    }.padding(.bottom, 10)
                     .font(Font.system(size: 21, weight: .regular))
                        .foregroundColor(Color.grayText)
                    
                }
                plusCircle(geometry: geometry)
                    .frame(alignment: .center)
                    
            }
        
           
        }
        
}

struct plusCircle: View {
    var geometry: GeometryProxy
    @State var showAddition: Bool = false
    var body: some View {
        
        return ZStack(alignment: .bottom) {
            if showAddition {
                //Color.black.opacity(0.5)
                VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
                    //.opacity(0.)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height, alignment: .center)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                    .onTapGesture {
                        self.showAddition = false
                }
                
            }
            VStack(spacing: 21) {
                if showAddition == true {
                    additionalView(geometry: geometry)
                        .transition(AnyTransition.move(edge: .bottom).combined(with: AnyTransition.opacity.animation(.easeInOut(duration: 0.3))))
                        .animation(.easeInOut)
                }
                Button (action: {
                    self.showAddition.toggle()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: geometry.size.height/10 - 20, height: geometry.size.height/10 - 20, alignment: .center)
                            .foregroundColor(Color.yellow)
                        Image(systemName: "plus")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 25, weight: .bold))
                        .rotationEffect((showAddition) ? .init(degrees: 45) : .init(degrees: 0))
                        .animation(.linear(duration: 0.2))
                    }.padding(.bottom, 15)
                    
                }
            
           }
        }
        .frame(width: geometry.size.width - 10, height: geometry.size.height, alignment: .bottom)
 }
}

struct additionalView : View {
    var geometry: GeometryProxy
    var body: some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 25).frame(width: geometry.size.width - 40, height: geometry.size.height/5.47, alignment: .center)
                .foregroundColor(Color.black)
            
            RoundedRectangle(cornerRadius: 25).frame(width: geometry.size.width - 40, height: geometry.size.height/5.47, alignment: .center)
            .foregroundColor(Color.black)
        }
            
    }
}



struct tabBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {geometry in
            plusCircle(geometry: geometry).padding()
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
