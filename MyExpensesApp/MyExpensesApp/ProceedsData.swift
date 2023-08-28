//
//  ProceedsData.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 28/08/2023.
//

import Foundation

class ProceedsData {
    @Published var items = [ProceedsItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "ProceedsData")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "ProseedsData") {
            if let decodedItems = try? JSONDecoder().decode([ProceedsItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
