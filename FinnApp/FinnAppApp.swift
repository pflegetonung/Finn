import SwiftUI

@main
struct FinnAppApp: App {
    @StateObject private var settingsVM = ProfileViewModel(coordinator: ContentCoordinator())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsVM)
        }
    }
}
