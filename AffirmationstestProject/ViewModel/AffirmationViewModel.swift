//
//  AffirmationViewModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 08.08.24.
//

import SwiftUI

class AffirmationViewModel: ObservableObject {
    @Published var affirmations: [Affirmation] = [
        Affirmation(text: "Я силен и уверен в себе."),
        Affirmation(text: "Я способен достигать своих целей."),
        Affirmation(text: "Я достоин счастья и успеха.")
    ]
    
    @Published var backgroundColor: Color = .white
    
    private let settingsService = SettingsService()
    
    init() {
        loadSettings()
    }
    
    private func loadSettings() {
        let settings = settingsService.loadSettings()
        backgroundColor = colorFromString(settings.selectedBackgroundColor)
        loadAffirmations(for: settings.selectedCategory)
    }
    
    private func colorFromString(_ color: String) -> Color {
        switch color {
        case "Красный":
            return .red
        case "Синий":
            return .blue
        default:
            return .white
        }
    }
    
    private func loadAffirmations(for category: String) {
        // TODO: 
    }
}
