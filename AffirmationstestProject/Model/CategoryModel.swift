//
//  CategoryModel.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import Foundation

enum CategoryType: String, Codable, CaseIterable {
    case friendship
    case love
}

struct CategoryModel: Identifiable, Codable, Equatable, Hashable {
    let id: UUID
    let categoryType: CategoryType
}
