//
//  BackgroundColorModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import SwiftUI

enum ColorTypes: String, Codable, CaseIterable {
    case Blue
    case Red
}

struct BackgroundColorModel: Identifiable, Codable, Equatable, Hashable{
    let id: UUID
    let colorType: ColorTypes

    var color: Color {
        switch colorType {
        case .Blue:
            return .blue
        case .Red:
            return .red
        }
    }
}
