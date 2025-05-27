//
//  TransactionModel.swift
//  FinnApp
//
//  Created by Phillip on 06.05.2025.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Double
    let description: String
}
