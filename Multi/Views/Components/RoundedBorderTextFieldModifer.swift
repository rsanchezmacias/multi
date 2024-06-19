//
//  RoundedBorderTextFieldModifer.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import Foundation
import SwiftUI

struct RoundedBorderTextFieldModifier: ViewModifier {
    var borderColor: Color
    var cornerRadius: CGFloat
    var lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: lineWidth)
            )
    }
}

extension View {
    func roundedBorderTextField(borderColor: Color = .black, cornerRadius: CGFloat = 8, lineWidth: CGFloat = 1) -> some View {
        self.modifier(RoundedBorderTextFieldModifier(borderColor: borderColor, cornerRadius: cornerRadius, lineWidth: lineWidth))
    }
}
