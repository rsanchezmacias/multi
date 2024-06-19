//
//  MainView.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import SwiftUI
import Dependencies

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    private let navigationTitle: String = "Setup Your Practice"
    
    var body: some View {
        VStack {
            Form {
                Section("Select Multiplication Tables") {
                    List(viewModel.options) { option  in
                        HStack {
                            Text("Table of \(option.value)")
                            Spacer()
                            CheckmarkButton(option: option)
                        }
                    }
                }
                
                Section("Number of Questions") {
                    Picker("Select the number of questions", selection: $viewModel.numberOfQuestions) {
                        ForEach(viewModel.numberOfQuestionsOptions, id: \.self) { option in
                            Text("\(option)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            
            Button {
                viewModel.startPractice()
            } label: {
                Text("Start practice")
                    .bold()
                    .foregroundStyle(Color.white)
            }
            .disabled(!viewModel.isStartEnabled)
            .frame(width: 180)
            .padding()
            .animation(nil, value: viewModel.isStartEnabled)
            .background(viewModel.isStartEnabled ? Color.pastelAqua : Color.gray)
            .animation(.default.speed(2), value: viewModel.isStartEnabled)
            .clipShape(.rect(cornerRadius: 8))
        }
        .navigationTitle(navigationTitle)
        .fullScreenCover(isPresented: $viewModel.practiceOngoing, content: {
            QuestionView()
                .environmentObject(viewModel)
        })
        
    }
    
}

#Preview {
    MainView()
}
