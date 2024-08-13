//
//  SettingsViewModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 12.08.24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var selectedCategory: CategoryType
    @Published var selectedBackgroundColor: ColorType
    @Published var selectedGender: GenderType
    
    @Published var categories: [CategoryModel] = []
    @Published var backgroundColors: [BackgroundColorModel] = []
    @Published var genders: [GenderModel] = []
    
    private var userSettings = UserSettings(isOnboardingCompleted: true)
    
    init() {
        let settingsService = SettingsService()
        self.userSettings = settingsService.loadSettings()
        self.selectedGender = userSettings.selectedGender ?? .female
        self.selectedBackgroundColor = userSettings.selectedBackgroundColor ?? .blue
        self.selectedCategory = userSettings.selectedCategory ?? .friendship
        
        loadCategories()
        loadBackgroundColors()
        loadGenders()
    }
    
    private func loadCategories() {
        categories = CategoryType.allCases.map { CategoryModel(id: UUID(), categoryType: $0) }
    }
    
    private func loadBackgroundColors() {
        backgroundColors = ColorType.allCases.map { BackgroundColorModel(id: UUID(), colorType: $0) }
    }
    
    private func loadGenders() {
        genders = GenderType.allCases.map { GenderModel(id: UUID(), genderType: $0) }
    }
    
    func saveSettings() {
        let settings = UserSettings(
            isOnboardingCompleted: true,
            selectedCategory: selectedCategory,
            selectedBackgroundColor: selectedBackgroundColor,
            selectedGender: selectedGender
        )
        SettingsService().saveSettings(settings)
    }
}
