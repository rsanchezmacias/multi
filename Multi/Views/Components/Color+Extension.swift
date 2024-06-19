//
//  Color+Extension.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/19/24.
//

import SwiftUI

extension Color {
    
    static let pastelAqua: Color = Color(red: 100, green: 216, blue: 217)
    static let pastelRed: Color = Color(red: 250, green: 153, blue: 151)
    static let pastelYellow: Color = Color(red: 252, green: 230, blue: 124)
    static let pastelLightYellow: Color = Color(red: 253, green: 255, blue: 171)
    
    init(red: Int, green: Int, blue: Int) {
        self.init(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
    }
    
}
