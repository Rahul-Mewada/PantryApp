//
//  ViewRouter.swift
//  PantryApp
//
//  Created by Rahul Mewada on 7/22/20.
//  Copyright © 2020 Rahul Mewada. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ViewRouter: ObservableObject {
    @Published var currentView = "home"
}
