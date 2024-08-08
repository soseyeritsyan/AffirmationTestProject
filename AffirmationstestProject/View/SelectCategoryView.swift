//
//  SelectCategoryView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

struct SelectCategoryView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("Выберите категорию")
            List(viewModel.categories) { category in
                Button(action: {
                    viewModel.selectedCategory = category
                }) {
                    Text(category.name)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(viewModel.selectedCategory == category ? Color.pink : Color.clear, lineWidth: 2)
                        )
                }
                .buttonStyle(PlainButtonStyle())
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
    }
}


#Preview {
    SelectCategoryView(viewModel: OnboardingViewModel())
}
