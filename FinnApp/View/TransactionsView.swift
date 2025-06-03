import SwiftUI
import Foundation

struct TransactionsView: View {
    @StateObject private var vm = TransactionViewModel()
    
    private var todayTransactions: [Transaction] {
        vm.transactions.filter { Calendar.current.isDateInToday($0.date) }
    }

    private var yesterdayTransactions: [Transaction] {
        vm.transactions.filter { Calendar.current.isDateInYesterday($0.date) }
    }

    private var olderTransactions: [Transaction] {
        vm.transactions
            .filter { !Calendar.current.isDateInToday($0.date) &&
                      !Calendar.current.isDateInYesterday($0.date) }
            .sorted { $0.date > $1.date }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    if !todayTransactions.isEmpty {
                        sectionView(title: "Today", items: todayTransactions)
                    }
                    if !yesterdayTransactions.isEmpty {
                        sectionView(title: "Yesterday", items: yesterdayTransactions)
                    }
                    if !olderTransactions.isEmpty {
                        sectionView(title: "Earlier", items: olderTransactions)
                    }
                }
                .navigationTitle("Transactions")
            }
        }
    }
    
    @ViewBuilder
    private func sectionView(title: String, items: [Transaction]) -> some View {
        VStack(alignment: .leading, spacing: -8) {
            Text(title)
                .mainLabelStyle(size: 16, weight: .medium, color: .gray)
                .padding(.horizontal)
                .padding(.bottom, 8)

            ForEach(items) { tx in
                ListItem(isIncome: tx.isIncome,
                         title: tx.title,
                         description: tx.description ?? "",
                         amount: tx.amount)
                .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileViewModel(coordinator: ContentCoordinator()))
}
