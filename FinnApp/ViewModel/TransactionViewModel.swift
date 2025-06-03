import Foundation
import Combine

@MainActor
final class TransactionViewModel: ObservableObject {
    @Published private(set) var transactions: [Transaction] = []
    
    init() {
        seedTemplates()
    }
    
    private func seedTemplates() {
        let calendar = Calendar.current
        let now = Date()
        
        transactions = [
            Transaction(
                title: "Coffee",
                description: .none,
                isIncome: false,
                amount: 250.0,
                date: now),
            
            Transaction(
                title: "Salary",
                description: "Lorem ipsum dolor sit amet dolor sit amet",
                isIncome: true,
                amount: 120_000.0,
                date: now.addingTimeInterval(-3600)
            ),
            
            Transaction(
                title: "Groceries",
                description: .none,
                isIncome: false,
                amount: 4_530.5,
                date: calendar.date(byAdding: .day, value: -1, to: now)!
            ),
            
            Transaction(
                title: "Gym membership",
                description: .none,
                isIncome: false,
                amount: 3_000.0,
                date: calendar.date(from: DateComponents(year: 2025, month: 5, day: 20))!
            )
        ]
    }
}
