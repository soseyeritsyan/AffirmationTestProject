//
//  OnboardingView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    @State private var showMainView = false
    
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
                    showMainView = true
                }
            }) {
                Text(viewModel.currentScreenIndex < 2 ? "Next" : "Finish")
                    .padding()
                    .background(viewModel.isSelectionMade ? Color.blue : Color.gray)

                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
                .disabled(!viewModel.isSelectionMade)
                .padding(),
            alignment: .bottom
        )
        .fullScreenCover(isPresented: $showMainView) {
            AffirmationView()
        }
    }
    
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
