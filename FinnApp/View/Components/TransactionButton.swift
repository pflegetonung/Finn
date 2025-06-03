import SwiftUI

struct TransactionButton: View {
    @State private var isShownAddOptions = false
    
    @Binding var isOverlayShown: Bool
    @Binding var isMainSheetShown: Bool
    
    var body: some View {
        Button {
            withAnimation {
                if !isShownAddOptions {
                    isShownAddOptions.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        withAnimation {
                            isShownAddOptions.toggle()
                        }
                    }
                }
            }
        } label: {
            ZStack {
                CustomBlur.Blur(style: .dark)
                    .cornerRadius(100)
                    .frame(width: isShownAddOptions ? 256 : 64, height: isShownAddOptions ? 48 : 32)
                    .animation(.spring(), value: isShownAddOptions)
                
                if isShownAddOptions {
                    HStack(spacing: 0) {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                isOverlayShown = true
                                isMainSheetShown = false
                            }
                        } label: {
                            Label("Income", systemImage: "plus")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 128, height: 24)
                        }
                        
                        Spacer()
                        
                        Rectangle()
                            .frame(width: 1, height: 40)
                            .foregroundColor(.white.opacity(0.1))
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                isOverlayShown = true
                                isMainSheetShown = false
                            }
                        } label: {
                            Label("Expense", systemImage: "minus")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .frame(width: 128, height: 24)
                        }
                        
                        Spacer()
                    }
                    .frame(width: 256)
                    .transition(.opacity)
                } else {
                    Image(systemName: "pencil")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
            }
        }
        .frame(height: 48)
    }
}

#Preview {
    ContentView()
//        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}
