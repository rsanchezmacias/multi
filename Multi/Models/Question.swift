//
//  Question.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import Foundation
import SwiftUI

/// Represents a multiplication question with its operands and user response
struct Question: Identifiable {
    
    /// A default question used as a placeholder
    static let defaultQuestion: Question = Question(left: -1, right: -1)
    
    let id: UUID = UUID()
    
    /// The left operand of the multiplication problem
    let left: Int
    
    /// The right operand of the multiplication problem
    let right: Int
    
    /// The user's response to the question
    var response: Int = 0
    
    /// Indicates whether the user's response is correct
    var correct: Bool {
        response == answer
    }
    
    /// The correct answer to the multiplication problem
    var answer: Int {
        left * right
    }
    
    /// A formatted string representation of the question
    var description: String {
        "\(left) x \(right)"
    }
    
    /// A formatted string showing the question and its result
    /// Includes both correct and incorrect responses
    var result: String {
        if correct {
            return "\(left) x \(right) = \(answer)"
        } else {
            return "\(left) x \(right) = \(answer), not \(response)"
        }
    }
    
    /// The color to display the result in (green for correct, red for incorrect)
    var color: Color {
        return correct ? .green  : .red
    }
    
}
