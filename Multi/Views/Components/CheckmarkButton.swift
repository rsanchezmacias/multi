//
//  CheckmarkButton.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import SwiftUI

struct CheckmarkButton: View {
    
    @ObservedObject var option: Option
    
    var body: some View {
        Button(action: {
            option.enabled.toggle()
        }) {
            Image(systemName: option.enabled ? "checkmark.square.fill" : "square")
                .font(.system(size: 28))
                .foregroundColor(option.enabled ? Color.pastelAqua : .gray)
        }
        .padding()
        .frame(width: 32, height: 32)
    }
}

#Preview {
    CheckmarkButton(option: Option(value: 1, enabled: true))
}
