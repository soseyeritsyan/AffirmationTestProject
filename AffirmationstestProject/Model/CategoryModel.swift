//
//  CategoryModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import Foundation

enum CategoryTypes: String, Codable {
    case Friendship
    case Love
}

struct CategoryModel: Identifiable, Codable, Equatable {
    let id: UUID
    let categoryType: CategoryTypes
}
