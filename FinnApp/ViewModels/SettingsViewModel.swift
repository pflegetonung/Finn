//
//  SettingsViewModel.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var selectedCurrency: Currency = .usd
    weak var coordinator: ContentCoordinator?

    init(coordinator: ContentCoordinator?) {
        self.coordinator = coordinator
    }

    func goBack() {
        coordinator?.goBack()
    }
}
