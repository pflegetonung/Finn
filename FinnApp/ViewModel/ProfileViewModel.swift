import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var selectedCurrency: Currency = .rub
    weak var coordinator: ContentCoordinator?

    init(coordinator: ContentCoordinator?) {
        self.coordinator = coordinator
    }

    func goBack() {
        coordinator?.goBack()
    }
}
