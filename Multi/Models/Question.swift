//
//  Question.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import Foundation
import SwiftUI

struct Question: Identifiable {
    
    static let defaultQuestion: Question = Question(left: -1, right: -1)
    
    let id: UUID = UUID()
    
    let left: Int
    let right: Int
    
    var response: Int = 0
    
    var correct: Bool {
        response == answer
    }
    
    var answer: Int {
        left * right
    }
    
    var description: String {
        "\(left) x \(right)"
    }
    
    var result: String {
        if correct {
            return "\(left) x \(right) = \(answer)"
        } else {
            return "\(left) x \(right) = \(answer), not \(response)"
        }
    }
    
    var color: Color {
        return correct ? .green  : .red
    }
    
}
