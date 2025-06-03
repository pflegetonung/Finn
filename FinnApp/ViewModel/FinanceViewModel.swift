import Foundation
import Combine

final class FinanceViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []

    var totalIncome: Double {
        transactions
            .filter { $0.amount > 0 }
            .map { $0.amount }
            .reduce(0, +)
    }

    var totalExpenses: Double {
        transactions
            .filter { $0.amount < 0 }
            .map { abs($0.amount) }
            .reduce(0, +)
    }

    var balance: Double {
        totalIncome - totalExpenses
    }

    func addTransaction(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}
