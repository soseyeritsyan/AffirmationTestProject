//
//  ContentView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        if viewModel.isCompleted {
            MainView()
        } else {
            OnboardingView(viewModel: viewModel)
        }
    }
}



#Preview {
    ContentView()
}
