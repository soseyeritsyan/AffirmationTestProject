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
        categories = [
            CategoryModel(id: UUID(), categoryType: .Love),
            CategoryModel(id: UUID(), categoryType: .Friendship)
        ]
    }
    
    func loadBackgroundColors() {
        backgroundColors = [
            BackgroundColorModel(id: UUID(), colorType: .Blue),
            BackgroundColorModel(id: UUID(), colorType: .Red)
        ]
    }
    
    func loadGenders() {
        genders = [
            GenderModel(id: UUID(), genderType: .Male),
            GenderModel(id: UUID(), genderType: .Female)
        ]
    }
    
    func completeOnboarding() {
        var settings = settingsService.loadSettings()
        settings.isOnboardingCompleted = true
        settings.selectedCategory = selectedCategory?.categoryType ?? .Friendship//.rawValue ?? ""
        settings.selectedBackgroundColor = selectedBackgroundColor?.colorType ?? .Blue//.rawValue ?? ""
        settings.selectedGender = selectedGender?.genderType ?? .Female//.rawValue ?? ""
        settingsService.saveSettings(settings)
        isCompleted = true
    }
}
