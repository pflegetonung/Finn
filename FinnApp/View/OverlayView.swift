import SwiftUI

struct OverlayView: View {
    @EnvironmentObject var settingsVM: ProfileViewModel
    
    @Binding var isOverlayShown: Bool
    @Binding var isMainSheetShown: Bool
    
    var body: some View {
        ZStack {
            CustomBlur.Blur(style: .dark)
            
            ZStack {
                RoundedRectangle(cornerRadius: 26)
                    .foregroundColor(.white)
                
                VStack {
                    HStack {
                        Button {
                            withAnimation {
                                isOverlayShown = false
                                isMainSheetShown = true
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                                .foregroundColor(.black.opacity(0.2))
                        }
                        
                        Spacer()
                    }
                    
                    Text("\(settingsVM.selectedCurrency.symbol)0.00")
                        .mainLabelStyle(size: 48, weight: .bold, color: .black)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .frame(height: 44)
                                .foregroundColor(.black)
                            
                            Text("Add expense")
                                .mainLabelStyle(size: 16, weight: .bold, color: .white)
                        }
                    }
                }
                .padding()
            }
            .frame(width: 256, height: 320)
        }
    }
}

#Preview {
    ContentView()
//        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}

