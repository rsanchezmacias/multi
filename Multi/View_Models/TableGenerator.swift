//
//  TableGenerator.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import Foundation
import Dependencies

/// Protocol defining the requirements for generating multiplication tables
protocol TableGeneratorProtocol {
    
    /// Generates a complete multiplication table for the specified range
    /// - Parameter range: The range of numbers to generate tables for (e.g., 2...12)
    /// - Returns: A dictionary where the key is the left operand and the value is an array of questions
    func generateTable(for range: ClosedRange<Int>) -> [Int: [Question]]
    
}

class TableGenerator: TableGeneratorProtocol {
    
    func generateTable(for range: ClosedRange<Int>) -> [Int: [Question]] {
        let lowerBound: Int = 1
        let upperBound: Int = range.upperBound
        
        var table: [Int: [Question]] = [:]
        
        for leftValue in lowerBound...upperBound {
            var questions: [Question] = []
            for rightValue in lowerBound...upperBound {
                let newQuestion = Question(left: leftValue, right: rightValue)
                questions.append(newQuestion)
            }
            table[leftValue] = questions
        }
        
        return table
    }
    
}

// MARK: - Dependency

extension DependencyValues {
    var tableGenerator: TableGeneratorProtocol {
        get { self[TableGeneratorKey.self] }
        set { self[TableGeneratorKey.self] = newValue }
    }
}

enum TableGeneratorKey: DependencyKey {
    static let liveValue: TableGeneratorProtocol = TableGenerator()
}
