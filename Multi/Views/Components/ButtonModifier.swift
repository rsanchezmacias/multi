//
//  ButtonModifier.swift
//  Multi
//
//  Created by Ricardo Sanchez-Macias on 6/19/24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.pastelAqua)
            .bold()
            .cornerRadius(8)
        
    }
    
}

extension View {
    
    func primaryButton() -> some View {
        self.modifier(ButtonModifier())
    }
    
}
