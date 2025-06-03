import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var settingsVM: ProfileViewModel
    
    @Binding var isProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    withAnimation {
                        isProfile = false
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(.systemBackground))
                            .frame(width: 44, height: 44)
                        
                        Circle()
                            .foregroundColor(Color(.secondarySystemBackground))
                            .frame(width: 32, height: 32)
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    }
                    .padding(4)
                }
            }
            
            ProfilePicture()
            
            VStack(spacing: 6) {
                Text("Name Surname")
                    .mainLabelStyle(size: 24, weight: .bold, color: .primary)
                
                Text("Achievements:")
                    .mainLabelStyle(size: 16, weight: .regular, color: .primary)
            }
            .padding(8)
            
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(Color(.secondarySystemBackground))
                .frame(height: 128)
            
            Picker("Currency", selection: $settingsVM.selectedCurrency) {
                ForEach(Currency.allCases, id: \.self) { currency in
                    Text(currency.symbol).tag(currency)
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

#Preview {
    ProfileView(isProfile: .constant(true))
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
    
//    ContentView()
//        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}
