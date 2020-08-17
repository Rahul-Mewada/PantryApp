//
//  SingleUnit.swift
//  PantryApp
//
//  Created by Rahul Mewada on 8/12/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import Foundation

class SingleUnit: Dimension {
    static let unit = SingleUnit(symbol: "units", converter: UnitConverterLinear(coefficient: 1))
    static let baseUnit = SingleUnit.unit

}
