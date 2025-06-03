import SwiftUI

struct BGPattern: View {
    var body: some View {
        Image("IMG_0389")
            .resizable()
            .scaledToFill()
            .frame(height: 350)
            .ignoresSafeArea()
            .blur(radius: 2, opaque: true)
        
        VStack(spacing: 0) {
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                .frame(height: 350)
            
            Color.black
            
            Color.primary
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}

