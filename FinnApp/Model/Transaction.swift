import Foundation

struct Transaction: Identifiable, Hashable, Codable {
    let id: UUID = .init()
    let title: String
    let description: String?
    let isIncome: Bool
    let amount: Double
    let date: Date
}
