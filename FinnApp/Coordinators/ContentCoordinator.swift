//
//  ContentCoordinator.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import SwiftUI

final class ContentCoordinator: ObservableObject {
    enum Route { case settings, stats }

    @Published var route: Route?

    func go(to route: Route) {
        self.route = route
    }

    func goBack() {
        self.route = nil
    }

    @ViewBuilder
    func destinationView(for route: Route) -> some View {
        switch route {
        case .settings:
            SettingsView()
        case .stats:
            StatsView()
        }
    }
}
