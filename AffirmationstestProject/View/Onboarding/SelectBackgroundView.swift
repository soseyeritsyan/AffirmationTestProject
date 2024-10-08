//
//  SelectBackgroundView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 06.08.24.
//

import SwiftUI

struct SelectBackgroundView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("Select background color")
            List(viewModel.backgroundColors) { color in
                Button(action: {
                    viewModel.selectedBackgroundColor = color
                }) {
                    Text(String(localized: LocalizedStringResource(stringLiteral: color.colorType.rawValue)))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(viewModel.selectedBackgroundColor == color ? Color.pink : Color.clear, lineWidth: 2)
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
    SelectBackgroundView(viewModel: OnboardingViewModel())
}
