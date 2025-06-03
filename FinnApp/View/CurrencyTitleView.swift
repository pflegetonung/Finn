import SwiftUI

struct CurrencyTitleView: View {
    @StateObject var financeVM = FinanceViewModel()
    @EnvironmentObject var settingsVM: ProfileViewModel
    
    @Binding var isOverlayShown: Bool
    @Binding var isMainSheetShown: Bool
    
    // TODO: REDO Percent
    let TEMPORARY_PERC: Double = 5
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 12) {
                HStack {
                    VStack(alignment: .trailing) {
                        Text("+\(settingsVM.selectedCurrency.symbol)\(String(format: "%.2f", financeVM.totalIncome))")
                        Text("-\(settingsVM.selectedCurrency.symbol)\(String(format: "%.2f", financeVM.totalExpenses))")
                    }
                    .mainLabelStyle(size: 10, weight: .semibold, color: .white.opacity(0.5))
                    
                    Image(systemName: TEMPORARY_PERC > 0 ? "arrow.up" : (TEMPORARY_PERC < 0 ? "arrow.down" : "minus"))
                        .foregroundColor(TEMPORARY_PERC > 0 ? .green : (TEMPORARY_PERC < 0 ? .red : .white.opacity(0.5)))
                    
                    Text("\(String(format: "%.2f", TEMPORARY_PERC))%")
                        .mainLabelStyle(size: 16, weight: .regular, color: .white.opacity(0.5))
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text("\(settingsVM.selectedCurrency.symbol) \(String(format: "%.2f", financeVM.balance).split(separator: ".")[0])")
                        .mainLabelStyle(size: 48, weight: .bold, color: .white)
                    
                    Text(".\(String(format: "%.2f", financeVM.balance).split(separator: ".")[1])")
                        .mainLabelStyle(size: 28, weight: .bold, color: .white)
                }
                
                TransactionButton(isOverlayShown: $isOverlayShown, isMainSheetShown: $isMainSheetShown)
            }
            
            Spacer()
            
            Rectangle()
                .frame(height: 450)
                .foregroundColor(.clear)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}

