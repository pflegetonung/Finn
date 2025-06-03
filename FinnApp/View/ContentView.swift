import SwiftUI

struct ContentView: View {
    @StateObject private var coordinator = ContentCoordinator()
    @StateObject private var contentVM: ContentViewModel
    
    @State private var isMainSheetShown = true
    @State private var isOverlayShown = false
    @State private var isProfile = false
    @State private var selectedDetent: PresentationDetent = .height(450)
    
    init() {
        let coordinator = ContentCoordinator()
        _coordinator = StateObject(wrappedValue: coordinator)
        _contentVM = StateObject(wrappedValue: ContentViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                BGPattern()
                    .ignoresSafeArea()
                
                CurrencyTitleView(isOverlayShown: $isOverlayShown, isMainSheetShown: $isMainSheetShown)
                    .padding()
                    .sheet(isPresented: $isMainSheetShown) {
                        Group {
                            if isProfile {
                                ProfileView(isProfile: $isProfile)
                            } else {
                                TransactionsView()
                            }
                        }
                        .presentationDetents([.height(450), .large], selection: $selectedDetent)
                        .presentationCornerRadius(48)
                        .presentationBackgroundInteraction(.enabled(upThrough: .large))
                        .interactiveDismissDisabled()
                        .onChange(of: isProfile) { newValue in
                            withAnimation(.easeInOut(duration: 0.25)) {
                                selectedDetent = newValue ? .large : .height(450)
                            }
                        }
                    }
                
                Button {
                    withAnimation {
                        isProfile.toggle()
                    }
                } label: {
                    ZStack {
                        CustomBlur.Blur(style: .dark)
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                        
                        Image("IMG_9480")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 38, height: 38)
                            .clipShape(Circle())
                    }
                }
                .padding()
                
                if isOverlayShown {
                    OverlayView(isOverlayShown: $isOverlayShown, isMainSheetShown: $isMainSheetShown)
                        .ignoresSafeArea()
                }
            }
            .navigationDestination(isPresented: Binding(
                get: { coordinator.route != nil },
                set: { if !$0 { coordinator.route = nil } }
            )) {
                if let route = coordinator.route {
                    coordinator.destinationView(for: route)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}
