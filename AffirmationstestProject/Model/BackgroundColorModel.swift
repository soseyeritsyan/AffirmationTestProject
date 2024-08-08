//
//  BackgroundColorModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import SwiftUI

struct BackgroundColorModel: Identifiable, Codable, Equatable {
    let id: UUID
    let colorName: String

    var color: Color {
        switch colorName {
        case "Синий":
            return .blue
        case "Красный":
            return .red
        default:
            return .clear
        }
    }
}
