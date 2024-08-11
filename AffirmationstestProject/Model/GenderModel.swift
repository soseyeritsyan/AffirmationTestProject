//
//  GenderModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import Foundation

enum GenderTypes: String, Codable {
    case Male
    case Female
}

struct GenderModel: Identifiable, Codable, Equatable {
    let id: UUID
    let genderType: GenderTypes
}
