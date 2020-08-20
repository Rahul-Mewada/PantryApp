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

                    HStack() {
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "house")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "archivebox")
                        }
                        
                        Spacer(minLength: geometry.size.height/10 + 30)
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "book")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "person")
                        }
                        
                        Spacer()
                    }.padding(.bottom, 10)
                     .font(Font.custom("Custom1", size: 20))
                    
                }
                plusCircle(geometry: geometry).offset(x: 0, y: -15)
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
                VisualEffectView(effect: UIBlurEffect(style: .light))
                    //.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height, alignment: .center)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                    .onTapGesture {
                        self.showAddition = false
                }
            }
            VStack(spacing: 30) {
                if showAddition == true {
                    additionalView()
                        .transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: .bottom), removal: AnyTransition.move(edge: .bottom)))
                        .animation(.linear(duration: 0.15))
                }
                Button (action: {
                    self.showAddition.toggle()
                }) {
                    ZStack {
                        Circle().frame(width: geometry.size.height/10 - 20, height: geometry.size.height/10 - 20, alignment: .center)
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Custom", size: 25))
                            .rotationEffect((showAddition) ? .init(degrees: 45) : .init(degrees: 0))
                            .animation(.default)
                    }
                    
                }
            
           }
        }
        .frame(width: geometry.size.width - 10, height: geometry.size.height, alignment: .bottom)
 }
}

struct additionalView : View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).frame(width: 200, height: 100, alignment: .center)
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
