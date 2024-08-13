//
//  SettingsView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 11.08.24.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            List {
                Section {
                    Picker("Category",
                           selection: $viewModel.selectedCategory,
                           content: {
                        ForEach(viewModel.categories, id: \.self) {
                            Text($0.categoryType.rawValue).tag($0.categoryType)
                        }
                    })
                    
                    Picker("Background color",
                           selection: $viewModel.selectedBackgroundColor,
                           content: {
                        ForEach(viewModel.backgroundColors, id: \.self) {
                            Text($0.colorType.rawValue).tag($0.colorType)
                        }
                    })
                    
                    Picker("Gender",
                           selection: $viewModel.selectedGender,
                           content: {
                        ForEach(viewModel.genders, id: \.self) {
                            Text($0.genderType.rawValue).tag($0.genderType)
                        }
                    })
                }
                
                Section {
                    Button(action: openLanguageSettings) {
                        HStack {
                            Text("Select language")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            Button(action: {
                viewModel.saveSettings()
                showAlert = true
            }) {
                Text("Save changes")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save changes"),
                    message: Text("Changes saved successfully"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationTitle("Settings")
        }
    }
    
    func openLanguageSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel())
}
