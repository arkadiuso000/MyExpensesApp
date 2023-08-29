//
//  ExpensesHistoryView.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 29/08/2023.
//

import SwiftUI

struct ExpensesHistoryView: View {
    
    @ObservedObject var expenses: ExpensesData
    
    @State private var isEditing = false
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationView {
        List {
            ForEach (expenses.items, id: \.id) { expense in
                
                Section(header: Text("\(expense.date.formatted(date: .abbreviated, time: .omitted))")) {
                    Text("\((expense.name == "") ? "Name: none" : expense.name)")
                            .bold()
                    if (!isEditing){
                        
                        Text("\((expense.type == "") ? "Type: none" : expense.type)")
                        Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "PLN"))
                        if (expense.describe != "") {
                            Text(expense.describe)
                        }
                    }
                    
                }
            }
            
            .onDelete(perform: removeItems)
            .deleteDisabled(!isEditing)
            
        }

        .navigationTitle("Expenses History")
//        .topBarTrailing(EditButton())
        .toolbar() {
            Button {
                withAnimation{
                    isEditing.toggle()
                }
            } label: {
                if self.isEditing {
                    Text("Done").foregroundStyle(.red).bold()
                }
                else {
                    Text("Edit").foregroundStyle(.blue)
                }
            }
        }
            

    }
        
       
}
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
          print(index)
        }
        
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ExpensesHistoryView(expenses: ExpensesData())
}
