//
//  QuestionView.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        GeometryReader(content: { geometry in
            NavigationStack {
                ZStack {
                    VStack(spacing: 24) {
                        Text(viewModel.questionNumber)
                            .bold()
                            .font(.system(size: 32))
                        
                        VStack {
                            HStack {
                                Image(systemName: "\(viewModel.currentQuestion.left).circle")
                                    .font(.system(size: 48))
                                Image(systemName: "x.square")
                                    .font(.system(size: 32))
                                Image(systemName: "\(viewModel.currentQuestion.right).circle")
                                    .font(.system(size: 48))
                            }
                            
                            TextField("=", text: $viewModel.userInput)
                                .font(.system(size: 40))
                                .labelsHidden()
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .roundedBorderTextField()
                                .padding()
                                .focused($isTextFieldFocused)
                            
                            Button {
                                viewModel.advance()
                            } label: {
                                Text("Next")
                                    .foregroundColor(Color.black)
                                    .frame(width: geometry.size.width * 0.40)
                                    .padding()
                                    .background(viewModel.userInput.count > 0 ? Color.green : Color.gray)
                                    .cornerRadius(8)
                            }
                            .disabled(viewModel.userInput.count == 0)
                        }
                        .frame(width: geometry.size.width * 0.66)
                    }
                    .navigationTitle(viewModel.currentQuestion.description)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Exit") {
                                viewModel.stopPractice()
                            }
                        }
                    }
                    .onChange(of: viewModel.showResults) { _, showResults in
                        guard showResults else {
                            return
                        }
                        
                        isTextFieldFocused = false
                    }
                    
                    if viewModel.showResults {
                        resultsOverlay(proxy: geometry)
                    }
                }
            }
        })
    }
    
    @ViewBuilder
    private func resultsOverlay(proxy: GeometryProxy) -> some View {
        ZStack {
            Color.black.opacity(0.5)
            ResultView()
                .frame(width: proxy.size.width * 0.66, height: proxy.size.height * 0.66)
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 8))
                .environmentObject(viewModel)
        }
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    let viewModel = MainViewModel()
    viewModel.startPractice()
    viewModel.showResults = true
    
    return QuestionView().environmentObject(viewModel)
}
