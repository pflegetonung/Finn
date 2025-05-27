//
//  ContentViewModel.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    weak var coordinator: ContentCoordinator?

    init(coordinator: ContentCoordinator? = nil) {
        self.coordinator = coordinator
    }

    func goToSettings() {
        coordinator?.route = .settings
    }

    func goToStats() {
        coordinator?.route = .stats
    }
}
