//
//  OnboardingView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        TabView(selection: $viewModel.currentScreenIndex) {
            SelectCategoryView(viewModel: viewModel).tag(0)
            SelectBackgroundView(viewModel: viewModel).tag(1)
            SelectGenderView(viewModel: viewModel).tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .overlay(
            Button(action: {
                if viewModel.currentScreenIndex < 2 {
                    viewModel.currentScreenIndex += 1
                } else {
                    viewModel.completeOnboarding()
                }
            }) {
                Text(viewModel.currentScreenIndex < 2 ? "Далее" : "Завершить")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(),
            alignment: .bottom
        )
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
