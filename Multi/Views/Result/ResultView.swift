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
                    .font(.title2)
                Text("Your score \(viewModel.userScore)/\(viewModel.questions.count)")
            }
            
            List(Array(viewModel.questions.enumerated()), id: \.element.id) { (index, question) in
                Text("\(index + 1). \(question.result)")
                    .foregroundStyle(question.color)
            }
            .listStyle(.plain)
            
            HStack {
                Button {
                    viewModel.restart()
                } label: {
                    Text("Restart")
                        .foregroundColor(Color.black)
                        .frame(width: 80)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                
                Button {
                    viewModel.stopPractice()
                } label: {
                    Text("Exit")
                        .foregroundColor(Color.black)
                        .frame(width: 80)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                    
                }
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
