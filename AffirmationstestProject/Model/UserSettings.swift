//
//  UserSettings.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

struct UserSettings: Codable {
    var isOnboardingCompleted: Bool
    var selectedCategory: CategoryType?
    var selectedBackgroundColor: ColorType?
    var selectedGender: GenderType?
}
