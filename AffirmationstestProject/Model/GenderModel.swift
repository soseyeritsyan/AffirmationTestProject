//
//  GenderModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import Foundation

enum GenderType: String, Codable, CaseIterable {
    case male
    case female
}

struct GenderModel: Identifiable, Codable, Equatable, Hashable {
    let id: UUID
    let genderType: GenderType
}
