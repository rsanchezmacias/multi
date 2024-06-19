//
//  Option.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import Combine
import Foundation

class Option: ObservableObject, Identifiable {
    
    let id = UUID()
    @Published var value: Int
    @Published var enabled: Bool

    init(value: Int, enabled: Bool) {
        self.value = value
        self.enabled = enabled
    }
    
}
