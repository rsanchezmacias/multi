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
        
        VStack(spacing: Constants.Spacing.verticalSpacing) {
            Text(viewModel.questionNumber)
                .bold()
                .font(.system(size: Constants.Typography.questionNumberSize))
                .padding(.top, Constants.Spacing.containerPadding)
            
            VStack {
                HStack {
                    Text("\(viewModel.currentQuestion.left)")
                        .font(.system(size: Constants.Typography.operandSize, weight: Constants.Typography.boldWeight))
                    Image(systemName: "xmark")
                        .font(.system(size: Constants.Typography.operandSize))
                    Text("\(viewModel.currentQuestion.right)")
                        .font(.system(size: Constants.Typography.operandSize, weight: Constants.Typography.boldWeight))
                    Image(systemName: "equal")
                        .font(.system(size: Constants.Typography.operandSize))
                }
                
                TextField("?", text: $viewModel.userInput)
                    .focused($isTextFieldFocused)
                    .font(.system(size: Constants.Typography.answerInputSize))
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
                        .background(viewModel.userInput.count > 0 ? Constants.Colors.pastelYellow : Color.gray)
                        .cornerRadius(Constants.Layout.cornerRadius)
                }
                .disabled(viewModel.userInput.count == 0)
                .padding(.bottom, Constants.Spacing.containerPadding)
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
