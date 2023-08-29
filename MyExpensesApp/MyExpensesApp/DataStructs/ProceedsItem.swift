//
//  ProceedsItem.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 28/08/2023.
//

import Foundation

struct ProceedsItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let describe: String
    let date: Date
    let amount: Double
}
