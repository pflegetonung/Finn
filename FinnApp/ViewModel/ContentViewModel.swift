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
