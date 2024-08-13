//
//  GenderModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import Foundation

enum GenderTypes: String, Codable, CaseIterable {
    case Male
    case Female
}

struct GenderModel: Identifiable, Codable, Equatable, Hashable {
    let id: UUID
    let genderType: GenderTypes
}
