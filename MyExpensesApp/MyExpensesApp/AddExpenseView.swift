//
//  AddExpenseView.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 28/08/2023.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses: ExpensesData
    @Environment(\.dismiss) var dismiss
    
    let types = ["Personal","Parties&Friends","Food","Various","Gym","Food"]
    
    @State private var name = ""
    @State private var type = ""
    @State private var describe = ""
    @State private var date = Date.now
    @State private var amount = 0.0
    
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    Section{
                        TextField("Name", text: $name)
                        
                        
                        Picker("Type", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        
                        TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "PLN"))
                    }
                    
                    DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date){
                        Text("Select date")
                    }
                    
                    Section{
                        TextField("Describe", text: $describe)
                    }header: {
                        Text("Optional")
                    }
                }
                .navigationTitle("AddExpense")
                
                
                Button {
                    let item = ExpenseItem(name: name, type: type, describe: describe, date: date, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }label:{
                    
                    Text("Save")
                        .font(.largeTitle)
                        .bold()
                        .tint(.white)
                        .frame( maxWidth: .infinity, maxHeight: 100, alignment: .center)
                        .background(.blue)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    AddExpenseView(expenses: ExpensesData())
}
    
    

