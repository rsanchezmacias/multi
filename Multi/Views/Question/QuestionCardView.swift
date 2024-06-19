//
//  QuestionCardView.swift
//  Multi
//
//  Created by Ricardo Sanchez-Macias on 6/19/24.
//

import SwiftUI

struct QuestionCardView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        
        VStack(spacing: 24) {
            Text(viewModel.questionNumber)
                .bold()
                .font(.system(size: 30))
                .padding(.top, 16)
            
            VStack {
                HStack {
                    Text("\(viewModel.currentQuestion.left)")
                        .font(.system(size: 30, weight: .bold))
                    Image(systemName: "xmark")
                        .font(.system(size: 30))
                    Text("\(viewModel.currentQuestion.right)")
                        .font(.system(size: 30, weight: .bold))
                    Image(systemName: "equal")
                        .font(.system(size: 30))
                }
                
                TextField("?", text: $viewModel.userInput)
                    .focused($isTextFieldFocused)
                    .font(.system(size: 40))
                    .labelsHidden()
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .roundedBorderTextField()
                    .padding()
                
                Button {
                    viewModel.advance()
                } label: {
                    Text("Next")
                        .bold()
                        .foregroundColor(Color.black)
                        .frame(width: 200)
                        .padding()
                        .background(viewModel.userInput.count > 0 ? Color.pastelYellow : Color.gray)
                        .cornerRadius(8)
                }
                .disabled(viewModel.userInput.count == 0)
                .padding(.bottom, 16)
            }
            
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        }
        .onChange(of: viewModel.showResults) { _, showResults in
            guard showResults else {
                return
            }
            isTextFieldFocused = false
        }
        
    }
    
}

#Preview {
    let viewModel = MainViewModel()
    viewModel.options[0].enabled = true
    viewModel.options[1].enabled = true
    viewModel.numberOfQuestions = 5
    viewModel.startPractice()
    
    return QuestionCardView().environmentObject(viewModel)
}
