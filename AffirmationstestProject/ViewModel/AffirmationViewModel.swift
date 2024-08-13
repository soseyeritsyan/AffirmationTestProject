//
//  AffirmationViewModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 08.08.24.
//

import SwiftUI

class AffirmationViewModel: ObservableObject {
    @Published var selectedAffirmations: [Affirmation] = []
    @Published var backgroundColor: Color = .white
    
    private let friendshipAffirmations: [Affirmation] = [
        Affirmation(textEng: "I am surrounded by supportive and loving friends",
                    textRus: "Меня окружают любящие и поддерживающие друзья"),
        Affirmation(textEng: "I attract positive and loyal friendships into my life",
                    textRus: "Я привлекаю в свою жизнь позитивные и верные дружеские отношения"),
        Affirmation(textEng: "My friends and I share mutual respect and trust",
                    textRus: "Я и мои друзья испытываем взаимное уважение и доверие"),
        Affirmation(textEng: "I am a kind and caring friend, and I receive the same in return",
                    textRus: "Я добрый и заботливый друг, и я получаю то же самое в ответ"),
        Affirmation(textEng: "My friendships are filled with joy, laughter, and understanding",
                    textRus: "Мои дружеские отношения наполнены радостью, смехом и пониманием"),
        Affirmation(textEng: "I am grateful for the amazing friends in my life",
                    textRus: "Я благодарен за удивительных друзей в моей жизни"),
        Affirmation(textEng: "I nurture and cherish my friendships",
                    textRus: "Я холю и лелею свои дружеские отношения"),
        Affirmation(textEng: "I attract friends who support and uplift me",
                    textRus: "Я привлекаю друзей, которые поддерживают и поднимают мне настроение"),
        Affirmation(textEng: "My friends and I grow together in love and harmony",
                    textRus: "Мы с друзьями растем вместе в любви и гармонии"),
        Affirmation(textEng: "I am a magnet for genuine and lasting friendships",
                    textRus: "Я притягиваю искренние и прочные дружеские отношения")
    ]
    
    private let loveAffirmations: [Affirmation] = [
        Affirmation(textEng: "I am worthy of love and deserve to receive love in abundance",
                    textRus: "Я достоин любви и заслуживаю получать ее в изобилии"),
        Affirmation(textEng: "My heart is open to giving and receiving love",
                    textRus: "Мое сердце открыто для того, чтобы дарить и получать любовь"),
        Affirmation(textEng: "I am surrounded by love every day and in every way",
                    textRus: "Я окружен любовью каждый день и во всех отношениях"),
        Affirmation(textEng: "I attract love and loving relationships into my life",
                    textRus: "Я привлекаю любовь и любовные отношения в свою жизнь"),
        Affirmation(textEng: "Love flows to me and through me effortlessly",
                    textRus: "Любовь течет ко мне и через меня без усилий"),
        Affirmation(textEng: "I radiate love and others reflect love back to me",
                    textRus: "Я излучаю любовь, и другие отражают ее в ответ."),
        Affirmation(textEng: "My relationships are filled with love, happiness, and respect",
                    textRus: "Мои отношения наполнены любовью, счастьем и уважением"),
        Affirmation(textEng: "I am grateful for the love that surrounds me",
                    textRus: "Я благодарна за любовь, которая меня окружает"),
        Affirmation(textEng: "Love comes to me easily and effortlessly",
                    textRus: "Любовь приходит ко мне легко и непринужденно"),
        Affirmation(textEng: "I am a magnet for loving and fulfilling relationships",
                    textRus: "Я - магнит для любящих и полноценных отношений")
    ]
    
    private let settingsService = SettingsService()
    
    init() {
        loadSettings()
    }
    
    func loadSettings() {
        let settings = settingsService.loadSettings()
        if let color = settings.selectedBackgroundColor {
            backgroundColor = getColor(from: color)
        }
        if let category = settings.selectedCategory {
            loadAffirmations(for: category)
        }
    }
    
    func getColor(from color: ColorTypes) -> Color {
        switch color {
        case .Blue:
            return .blue
        case .Red:
            return .red
        }
    }
    
    private func loadAffirmations(for category: CategoryTypes) {
        switch category {
        case .Friendship:
            selectedAffirmations = friendshipAffirmations
        case .Love:
            selectedAffirmations = loveAffirmations
        }
    }
}
