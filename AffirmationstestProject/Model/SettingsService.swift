//
//  SettingsService.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import Foundation

class SettingsService {
    private let userDefaultsKey = "UserSettings"
    
    func loadSettings() -> UserSettings {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let settings = try? JSONDecoder().decode(UserSettings.self, from: data) {
            return settings
        }
        return UserSettings(isOnboardingCompleted: false, selectedCategory: "", selectedBackgroundColor: "", selectedGender: "")
    }
    
    func saveSettings(_ settings: UserSettings) {
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
}
