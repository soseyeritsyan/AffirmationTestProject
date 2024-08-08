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
            CategoryModel(id: UUID(), name: "Любовь"),
            CategoryModel(id: UUID(), name: "Дружба")
        ]
    }
    
    func loadBackgroundColors() {
        backgroundColors = [
            BackgroundColorModel(id: UUID(), colorName: "Синий"),
            BackgroundColorModel(id: UUID(), colorName: "Красный")
        ]
    }
    
    func loadGenders() {
        genders = [
            GenderModel(id: UUID(), gender: "Мужчина"),
            GenderModel(id: UUID(), gender: "Женщина")
        ]
    }
    
    func completeOnboarding() {
        var settings = settingsService.loadSettings()
        settings.isOnboardingCompleted = true
        settings.selectedCategory = selectedCategory?.name ?? ""
        settings.selectedBackgroundColor = selectedBackgroundColor?.colorName ?? ""
        settings.selectedGender = selectedGender?.gender ?? ""
        settingsService.saveSettings(settings)
        isCompleted = true
    }
}
