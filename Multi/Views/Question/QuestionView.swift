//
//  QuestionView.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @State var showExitAlert: Bool = false
    
    var body: some View {
        GeometryReader(content: { geometry in
            NavigationStack {
                ZStack {
                    Color.pastelYellow
                        .ignoresSafeArea()
                    
                    VStack(spacing: 24) {
                        Text(viewModel.formattedTime)
                            .bold()
                            .font(.system(size: 30, design: .monospaced))
                            .padding(.top, 16)
                        
                        QuestionCardView()
                            .compositingGroup()
                            .shadow(radius: 8, x: 6, y: 6)
                            .frame(width: geometry.size.width * 0.75)
                    }
                    .navigationTitle(viewModel.showResults ? "Results" : viewModel.currentQuestion.description)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Exit") {
                                showExitAlert = true
                            }
                        }
                    }
                    
                    if viewModel.showResults {
                        resultsOverlay(proxy: geometry)
                            .ignoresSafeArea()
                    }
                }
                .alert("Are you sure you want to exit?", isPresented: $showExitAlert) {
                    Button { } label: {
                        Text("Cancel")
                    }
                    
                    Button {
                        viewModel.stopPractice()
                    } label: {
                        Text("Exit")
                    }
                } message: {
                    Text("The progress will not be saved and you will need to restart")
                }
            }
        })
    }
    
    @ViewBuilder
    private func resultsOverlay(proxy: GeometryProxy) -> some View {
        ZStack {
            Color.black.opacity(0.5)
            ResultView()
                .frame(width: proxy.size.width * 0.80, height: proxy.size.height * 0.66)
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 16))
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
