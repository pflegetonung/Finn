import SwiftUI

struct ListItem: View {
    @EnvironmentObject var settingsVM: ProfileViewModel
    
    @State var isIncome: Bool
    @State var title: String
    @State var description: String
    @State var amount: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemBackground))
            
            HStack {
                Text("☕️")
                    .font(.title)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(title)
                            .mainLabelStyle(size: 16, weight: .medium, color: .primary)
                        
                        Text(description)
                            .mainLabelStyle(size: 16, weight: .light, color: .gray)
                    }
                    .lineLimit(1)
                    
                    Text("17:01")
                        .mainLabelStyle(size: 12, weight: .light, color: .gray)
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text(settingsVM.selectedCurrency.symbol)
                    Text(formatNumber(amount))
                }
                .foregroundColor(isIncome ? .green : .red)
                .mainLabelStyle(size: 18, weight: .bold, color: .white)
                .lineLimit(1)
            }
            .padding()
        }
        .contextMenu {
            Button {
                withAnimation {
                    
                }
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            
            Button(role: .destructive) {
                withAnimation {
                    
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
    
    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}
