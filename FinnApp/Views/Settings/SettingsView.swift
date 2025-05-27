//
//  SettingsView.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
//                        settingsVM.goBack()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
            }
            
//            Picker("Currency", selection: $settingsVM.selectedCurrency) {
//                ForEach(Currency.allCases, id: \.self) { currency in
//                    Text(currency.symbol).tag(currency)
//                }
//            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(SettingsViewModel(coordinator: ContentCoordinator()))
}
