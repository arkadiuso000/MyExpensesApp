//
//  ExpenseItem.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 27/08/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let describe: String
    let date: Date
    let amount: Double
}
