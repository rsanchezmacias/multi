//
//  MainViewModel.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import Foundation
import Dependencies
import Combine

class MainViewModel: ObservableObject {
    
    @Dependency(\.tableGenerator) var tableGenerator
    
    private let optionsRange: ClosedRange<Int> = 2...12
    
    private var table: [Int: [Question]] = [:]
    @Published var questions: [Question] = []
    @Published var options: [Option] = []
    
    @Published var numberOfQuestions: Int = 5
    let numberOfQuestionsOptions: [Int] = [5, 10, 15, 20]
    
    @Published var practiceOngoing: Bool = false
    @Published var isStartEnabled: Bool = false
    
    // MARK: - Question tracking
    @Published var userScore: Int = 0
    @Published var currentQuestion: Question = .defaultQuestion
    @Published var userInput: String = ""
    private var currentQuestionIndex: Int = 0
    
    @Published var showResults: Bool = false
    
    var questionNumber: String {
        return "Question \(currentQuestionIndex + 1) of \(questions.count)"
    }
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        loadTable()
        loadOptions()
        recalculateStartEnabled()
        
        listenToEnabledOptions()
    }
    
    private func listenToEnabledOptions() {
        for option in options {
            option.$enabled.debounce(for: 0.1, scheduler: DispatchQueue.main).sink { [weak self] _ in
                self?.recalculateStartEnabled()
            }
            .store(in: &subscriptions)
        }
    }
    
    private func recalculateStartEnabled() {
        isStartEnabled = options.map { $0.enabled }.contains { $0 }
    }
    
    func loadTable() {
        table = tableGenerator.generateTable(for: optionsRange)
    }
    
    func loadOptions() {
        for option in optionsRange {
            options.append(Option(value: option, enabled: false))
        }
    }
    
    func resetEnabledOptions() {
        for option in options {
            option.enabled = false
        }
    }
    
    func restart() {
        showResults = false
        startPractice()
    }
    
    func advance() {
        checkUserInput()
        
        if currentQuestionIndex == questions.count - 1 {
            showResults = true
        } else {
            userInput = ""
            currentQuestionIndex += 1
            currentQuestion = questions[currentQuestionIndex]
        }
    }
    
    func checkUserInput() {
        guard let input = Int(userInput) else {
            return
        }
        
        if input == currentQuestion.answer {
            userScore += 1
        }
        
        questions[currentQuestionIndex].response = input
    }
    
    func startPractice() {
        prepareQuestions()
        practiceOngoing = true
        userInput = ""
        
        resetQuestionProgress()
        currentQuestion = questions[0]
    }
    
    func resetQuestionProgress() {
        userScore = 0
        currentQuestionIndex = 0
        currentQuestion = .defaultQuestion
        showResults = false
    }
    
    func stopPractice() {
        showResults = false
        practiceOngoing = false
        resetEnabledOptions()
        numberOfQuestions = 5
    }
    
    /// Load the questions based on the user selections
    private func prepareQuestions() {
        let selectedOptions: [Option] = options.filter { $0.enabled }
        var questions: [[Question]] = []
        
        for selectedOption in selectedOptions {
            if let optionQuestions = table[selectedOption.value] {
                questions.append(optionQuestions)
            }
        }
        
        var shuffledQuestions = questions.flatMap { $0 }
        shuffledQuestions.shuffle()
        
        while shuffledQuestions.count < numberOfQuestions {
            let randomQuestion = shuffledQuestions.randomElement() ?? Question(left: 0, right: 0)
            shuffledQuestions.append(randomQuestion)
        }
        
        var finalQuestions: [Question] = []
        
        for _ in 0..<numberOfQuestions {
            let question = shuffledQuestions[shuffledQuestions.count - 1]
            shuffledQuestions.removeLast()
            finalQuestions.append(question)
        }
        
        self.questions = finalQuestions
    }
    
}
