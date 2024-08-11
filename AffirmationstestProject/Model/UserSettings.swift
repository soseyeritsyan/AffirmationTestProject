//
//  UserSettings.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

struct UserSettings: Codable {
    var isOnboardingCompleted: Bool
    var selectedCategory: CategoryTypes?
    var selectedBackgroundColor: ColorTypes?
    var selectedGender: GenderTypes?
}
