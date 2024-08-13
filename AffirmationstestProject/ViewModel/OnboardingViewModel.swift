//
//  OnboardingViewModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentScreenIndex: Int = 0
    @Published var isCompleted: Bool = false
    
    @Published var selectedCategory: CategoryModel?
    @Published var selectedBackgroundColor: BackgroundColorModel?
    @Published var selectedGender: GenderModel?
    
    @Published var categories: [CategoryModel] = []
    @Published var backgroundColors: [BackgroundColorModel] = []
    @Published var genders: [GenderModel] = []

    private let settingsService = SettingsService()
    
    var isSelectionMade: Bool {
        switch currentScreenIndex {
        case 0:
            return selectedCategory != nil
        case 1:
            return selectedBackgroundColor != nil
        case 2:
            return selectedGender != nil
        default:
            return false
        }
    }
    
    init() {
        loadCategories()
        loadBackgroundColors()
        loadGenders()
        checkOnboardingStatus()
    }
    
    private func checkOnboardingStatus() {
        let settings = settingsService.loadSettings()
        isCompleted = settings.isOnboardingCompleted
    }
    
    func loadCategories() {
        categories = CategoryType.allCases.map { CategoryModel(id: UUID(), categoryType: $0) }
    }
    
    func loadBackgroundColors() {
        backgroundColors = ColorType.allCases.map { BackgroundColorModel(id: UUID(), colorType: $0) }
    }
    
    func loadGenders() {
        genders = GenderType.allCases.map { GenderModel(id: UUID(), genderType: $0) }
    }
    
    func completeOnboarding() {
        var settings = settingsService.loadSettings()
        settings.isOnboardingCompleted = true
        settings.selectedCategory = selectedCategory?.categoryType ?? .friendship//.rawValue ?? ""
        settings.selectedBackgroundColor = selectedBackgroundColor?.colorType ?? .blue//.rawValue ?? ""
        settings.selectedGender = selectedGender?.genderType ?? .female//.rawValue ?? ""
        settingsService.saveSettings(settings)
        isCompleted = true
    }
}
