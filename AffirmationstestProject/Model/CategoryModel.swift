//
//  CategoryModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import Foundation

enum CategoryTypes: String, Codable, CaseIterable {
    case Friendship
    case Love
}

struct CategoryModel: Identifiable, Codable, Equatable, Hashable {
    let id: UUID
    let categoryType: CategoryTypes
}
