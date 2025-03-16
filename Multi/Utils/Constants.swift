//
//  Constants.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/19/24.
//

import SwiftUI

/// Contains all application-wide constants organized by category
enum Constants {
    
    /// Constants related to the multiplication table generation and practice
    enum Practice {
        /// The range of multiplication tables available for practice (2-12)
        static let tableRange: ClosedRange<Int> = 2...12
        
        /// The lower bound for multiplication table generation (always starts at 1)
        static let tableLowerBound: Int = 1
        
        /// Default number of questions when starting practice
        static let defaultQuestionCount: Int = 5
        
        /// Available options for number of questions
        static let questionCountOptions: [Int] = [5, 10, 15, 20]
        
        /// Timer update interval in seconds
        static let timerInterval: TimeInterval = 1.0
    }
    
    /// Constants related to UI layout and styling
    enum Layout {
        /// Default corner radius for rounded corners
        static let cornerRadius: CGFloat = 8
        
        /// Default line width for borders
        static let borderWidth: CGFloat = 1
        
        /// Default shadow radius
        static let shadowRadius: CGFloat = 8
        
        /// Default shadow offset
        static let shadowOffset: CGSize = CGSize(width: 6, height: 6)
        
        /// Question card width as a percentage of screen width
        static let questionCardWidth: CGFloat = 0.75
        
        /// Results overlay width as a percentage of screen width
        static let resultsOverlayWidth: CGFloat = 0.80
        
        /// Results overlay height as a percentage of screen height
        static let resultsOverlayHeight: CGFloat = 0.66
    }
    
    /// Constants related to typography and text styling
    enum Typography {
        /// Font size for question numbers
        static let questionNumberSize: CGFloat = 30
        
        /// Font size for question operands
        static let operandSize: CGFloat = 30
        
        /// Font size for answer input
        static let answerInputSize: CGFloat = 40
        
        /// Font size for results text
        static let resultsTextSize: CGFloat = 18
        
        /// Font weight for bold text
        static let boldWeight: Font.Weight = .bold
        
        /// Font weight for semibold text
        static let semiboldWeight: Font.Weight = .semibold
    }
    
    /// Constants related to colors and visual styling
    enum Colors {
        /// Pastel aqua color used for primary actions
        static let pastelAqua = Color(red: 100, green: 216, blue: 217)
        
        /// Pastel red color used for incorrect answers
        static let pastelRed = Color(red: 250, green: 153, blue: 151)
        
        /// Pastel yellow color used for backgrounds and enabled states
        static let pastelYellow = Color(red: 252, green: 230, blue: 124)
        
        /// Pastel light yellow color used for secondary backgrounds
        static let pastelLightYellow = Color(red: 253, green: 255, blue: 171)
        
        /// Color for correct answers
        static let correctAnswer = Color.green
        
        /// Color for incorrect answers
        static let incorrectAnswer = Color.red
    }
    
    /// Constants related to spacing and padding
    enum Spacing {
        /// Default vertical spacing between elements
        static let verticalSpacing: CGFloat = 24
        
        /// Default horizontal spacing between elements
        static let horizontalSpacing: CGFloat = 16
        
        /// Default padding for containers
        static let containerPadding: CGFloat = 16
    }
} 