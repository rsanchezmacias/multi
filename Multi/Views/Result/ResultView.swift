//
//  ResultView.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Your Results")
                    .bold()
                    .font(.title)
                    .padding()
                Text("Your score \(viewModel.userScore)/\(viewModel.questions.count)")
                    .font(.system(size: 18, weight: .semibold))
                Text("Time taken: \(viewModel.formattedTime)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.top, 4)
            }
            
            List(Array(viewModel.questions.enumerated()), id: \.element.id) { (index, question) in
                Text("\(index + 1). \(question.result)")
                    .foregroundStyle(question.color)
            }
            .listStyle(.plain)
            
            HStack(spacing: 0) {
                Button {
                    viewModel.stopPractice()
                } label: {
                    Text("Exit")
                        .frame(maxWidth: .infinity)
                        .primaryButton()
                }
                .padding()
                
                Button {
                    viewModel.restart()
                } label: {
                    Text("Restart")
                        .frame(maxWidth: .infinity)
                        .primaryButton()
                }
                .padding()
            }
        }
    }
}

#Preview {
    let viewModel = MainViewModel()
    viewModel.options[0].enabled = true
    viewModel.options[1].enabled = true
    viewModel.numberOfQuestions = 5
    viewModel.startPractice()
    
    return ResultView().environmentObject(viewModel)
}
