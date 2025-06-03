import SwiftUI

struct ProfilePicture: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(.secondarySystemBackground))
                .frame(width: 142, height: 142)
            
            Circle()
                .foregroundColor(Color(.systemBackground))
                .frame(width: 134, height: 134)
            
            Image("IMG_9480")
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .clipShape(Circle())
            
            Menu {
                Button {
                    withAnimation {
                        
                    }
                } label: {
                    Label("Gallery", systemImage: "photo.on.rectangle.angled")
                }
                
                Button {
                    withAnimation {
                        
                    }
                } label: {
                    Label("Camera", systemImage: "camera")
                }
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color(.secondarySystemBackground))
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: "pencil.and.scribble")
                        .foregroundColor(.primary)
                }
            }
            .menuStyle(.borderlessButton)
            .offset(x: 48, y: 48)
        }
    }
}

#Preview {
    ProfileView(isProfile: .constant(true))
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}
