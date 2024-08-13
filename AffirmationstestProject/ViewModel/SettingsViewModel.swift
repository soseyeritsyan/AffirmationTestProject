//
//  SettingsViewModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 12.08.24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var selectedCategory: CategoryTypes
    @Published var selectedBackgroundColor: ColorTypes
    @Published var selectedGender: GenderTypes
    
    @Published var categories: [CategoryModel] = []
    @Published var backgroundColors: [BackgroundColorModel] = []
    @Published var genders: [GenderModel] = []
    
    private var userSettings = UserSettings(isOnboardingCompleted: true)
    
    init() {
        let settingsService = SettingsService()
        self.userSettings = settingsService.loadSettings()
        self.selectedGender = userSettings.selectedGender ?? .Female
        self.selectedBackgroundColor = userSettings.selectedBackgroundColor ?? .Blue
        self.selectedCategory = userSettings.selectedCategory ?? .Friendship
        
        loadCategories()
        loadBackgroundColors()
        loadGenders()
    }
    
    func loadCategories() {
        categories = CategoryTypes.allCases.map { CategoryModel(id: UUID(), categoryType: $0) }
    }
    
    func loadBackgroundColors() {
        backgroundColors = ColorTypes.allCases.map { BackgroundColorModel(id: UUID(), colorType: $0) }
    }
    
    func loadGenders() {
        genders = GenderTypes.allCases.map { GenderModel(id: UUID(), genderType: $0) }
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
