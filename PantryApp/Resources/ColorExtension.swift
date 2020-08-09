//
//  ColorExtension.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/14/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import SwiftUI

extension Color {
    static let themeAccent = Color("AccentColor")
    static let themeBackground = Color("BackgroundColor")
    static let themeForeground = Color("ForegroundColor")
    static let grayBox = Color("GrayBox")
    static let grayTextBox = Color("GrayTextBox")
}



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
