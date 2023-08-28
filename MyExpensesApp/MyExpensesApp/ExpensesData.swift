//
//  ExpensesData.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 28/08/2023.
//

import Foundation

class ExpensesData: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "ExpenseData")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "ExpenseData") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
