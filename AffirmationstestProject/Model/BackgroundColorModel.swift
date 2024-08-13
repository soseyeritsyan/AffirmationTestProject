//
//  BackgroundColorModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import SwiftUI

enum ColorType: String, Codable, CaseIterable {
    case blue
    case red
}

struct BackgroundColorModel: Identifiable, Codable, Equatable, Hashable{
    let id: UUID
    let colorType: ColorType

    var color: Color {
        switch colorType {
        case .blue:
            return .blue
        case .red:
            return .red
        }
    }
}
