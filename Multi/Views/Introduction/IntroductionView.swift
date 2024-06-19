//
//  IntroductionView.swift
//  MultiApp
//
//  Created by Ricardo Sanchez-Macias on 6/15/24.
//

import SwiftUI

struct IntroductionView: View {
    
    private let title: String = "Multiplication Practice"
    
    private let instructions: [String] = [
        "1. Select the multiplication tables you want to practice",
        "2. The number of questions you want to practice",
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Image("intro_cover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: (UIScreen.main.bounds.height) * 0.6)
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(title)
                            .bold()
                            .font(.system(size: 24))
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(instructions, id: \.self) {
                                Text($0)
                                    .font(.system(size: 16))
                            }
                        }
                    }
                    
                    NavigationLink(destination: MainView()) {
                        Text("Get started")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.pastelAqua)
                            .clipShape(.rect(cornerRadius: 8))
                            .foregroundStyle(Color.white)
                            .padding()
                    }

                }
                .padding([.leading, .trailing], 32)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .tint(Color.black)
    }
    
}

#Preview {
    IntroductionView()
}
