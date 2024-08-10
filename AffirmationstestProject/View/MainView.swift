//
//  MainView.swift
//  AffirmationstestProject
//
//  Created by sose yeritsyan on 08.08.24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = AffirmationViewModel()
    @State private var currentIndex = 0
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(viewModel.affirmations.indices, id: \.self) { index in
                VStack {
                    Text(viewModel.affirmations[index].text)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.clear)
                        .rotationEffect(.degrees(-90))
                }
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .rotationEffect(.degrees(90))
        .background(viewModel.backgroundColor)
        .ignoresSafeArea()
    }
}
            

#Preview {
    MainView()
}
