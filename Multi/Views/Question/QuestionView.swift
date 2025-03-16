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
                    Constants.Colors.pastelYellow
                        .ignoresSafeArea()
                    
                    VStack(spacing: Constants.Spacing.verticalSpacing) {
                        Text(viewModel.formattedTime)
                            .bold()
                            .font(.system(size: Constants.Typography.questionNumberSize, design: .monospaced))
                            .padding(.top, Constants.Spacing.containerPadding)
                        
                        QuestionCardView()
                            .compositingGroup()
                            .shadow(radius: Constants.Layout.shadowRadius, x: Constants.Layout.shadowOffset.width, y: Constants.Layout.shadowOffset.height)
                            .frame(width: geometry.size.width * Constants.Layout.questionCardWidth)
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
                .frame(width: proxy.size.width * Constants.Layout.resultsOverlayWidth, height: proxy.size.height * Constants.Layout.resultsOverlayHeight)
                .padding()
                .background(Color.white)
                .clipShape(.rect(cornerRadius: Constants.Layout.cornerRadius))
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
