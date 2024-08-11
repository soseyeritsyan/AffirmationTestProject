//
//  SelectGenderView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 07.08.24.
//

import SwiftUI

struct SelectGenderView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("Select gender")
            List(viewModel.genders) { gender in
                Button(action: {
                    viewModel.selectedGender = gender
                }) {
                    Text(String(localized: LocalizedStringResource(stringLiteral: gender.genderType.rawValue)))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(viewModel.selectedGender == gender ? Color.pink : Color.clear, lineWidth: 2)
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
    SelectGenderView(viewModel: OnboardingViewModel())
}
