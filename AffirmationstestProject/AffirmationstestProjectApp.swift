//
//  AffirmationstestProjectApp.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

@main
struct AffirmationstestProjectApp: App {
    var body: some Scene {
        WindowGroup {
            let settingsService = SettingsService()
            let userSettings = settingsService.loadSettings()
            
            if userSettings.isOnboardingCompleted {
                MainView()
            } else {
                OnboardingView(viewModel: OnboardingViewModel())
            }
        }
    }
}
