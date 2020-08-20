//
//  curvedTabBar.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/18/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

struct curvedTabBar: View {
    var body: some View {
        curvedShape()
    }
}

struct curvedTabBar_Previews: PreviewProvider {
    static var previews: some View {
        curvedTabBar()
    }
}

struct curvedShape: View {
    let smallRadius:CGFloat = 4
    let largeRadius: CGFloat = 39
    let bottomCurveRadius: CGFloat = 33
    let topCurveRadius: CGFloat = 6
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 5 + bottomCurveRadius, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - 5 - bottomCurveRadius, y: 0))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 5 - bottomCurveRadius, y: bottomCurveRadius), radius: bottomCurveRadius, startAngle: .init(degrees: -90), endAngle: .init(degrees: 0), clockwise: false)
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - 5, y: 60 - topCurveRadius))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width - 5 - topCurveRadius, y: 60 - topCurveRadius), radius: topCurveRadius, startAngle: .init(degrees: 0), endAngle: .init(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: (UIScreen.main.bounds.width - 5)/2 + 43, y: 60))
            path.addArc(center: CGPoint(x: (UIScreen.main.bounds.width - 5)/2 + 43 , y: 60 - smallRadius), radius: smallRadius, startAngle: .init(degrees: 90), endAngle: .init(degrees: -178), clockwise: false)
            path.addArc(center: CGPoint(x: (UIScreen.main.bounds.width - 5)/2, y: 60 - smallRadius), radius: largeRadius, startAngle: .init(degrees: -0.9), endAngle: .init(degrees: 180.9), clockwise: true)
            path.addArc(center: CGPoint(x: (UIScreen.main.bounds.width - 5)/2 - 43 , y: 60 - smallRadius), radius: smallRadius, startAngle: .init(degrees: 0.9), endAngle: .init(degrees: 90), clockwise: false)
            path.addLine(to: CGPoint(x: 5 + topCurveRadius, y: 60))
            path.addArc(center: CGPoint(x: 5 + topCurveRadius, y: 60 - topCurveRadius), radius: topCurveRadius, startAngle: .init(degrees: 90), endAngle: .init(degrees: 180), clockwise: false)
            path.addLine(to: CGPoint(x: 5, y: bottomCurveRadius))
            path.addArc(center: CGPoint(x: 5 + bottomCurveRadius, y: bottomCurveRadius), radius: bottomCurveRadius, startAngle: .init(degrees: 180), endAngle: .init(degrees: -90), clockwise: false)
            }
        .fill()
        .rotationEffect(.init(degrees: 180))
        
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
