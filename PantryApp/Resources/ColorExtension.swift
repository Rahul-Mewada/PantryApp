//
//  ColorExtension.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/14/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

extension Color {
    static let homeBackground = Color("homeBackground")
    static let themeAccent = Color("AccentColor")
    static let themeBackground = Color("BackgroundColor")
    static let themeForeground = Color("ForegroundColor")
    static let grayBox = Color("grayBox")
    static let grayText = Color("grayText")
    static let greenBox = Color("greenBox")
    static let greenText = Color("greenText")
    static let yellowBox = Color("yellowBox")
    static let yellowText = Color("yellowText")
    static let redBox = Color("redBox")
    static let redText = Color("redText")
    static let purpleBox = Color("purpleBox")
    static let purpleText = Color("purpleText")
}


extension Color {

    func uiColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}

