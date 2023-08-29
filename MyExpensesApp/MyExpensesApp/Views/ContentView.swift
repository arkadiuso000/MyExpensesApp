//
//  ContentView.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 26/08/2023.
//

import SwiftUI



struct ContentView: View {
    @State private var bankBalance = 0.0
    @State private var sumOfExpenses = 0.0
    @State private var sumOfProceeds = 0.0
    
    @State private var showingAddExpense = false
    @State private var showingExpensesHistory = false
    
    //arr with expenses
    @StateObject private var expensesData = ExpensesData()
    var body: some View {
        NavigationView {
            
            VStack{
                Spacer()
                HStack(spacing: 10) {
                    
                    Text("Bank balance\n\(bankBalance.formatted(.currency(code: Locale.current.currency?.identifier ?? "PLN")))")
                        .multilineTextAlignment(.center)
                        .frame(width: 120, height: 50)
                        .background(.green).opacity(0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    
                    Text("Expenses\n\(sumOfExpenses.formatted(.currency(code: Locale.current.currency?.identifier ?? "PLN")))")
                        .multilineTextAlignment(.center)
                        .frame(width: 120, height: 50)
                        .background(.red).opacity(0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            showingExpensesHistory = true
                        }
                    
                    Text("Proceeds\n\(sumOfProceeds.formatted(.currency(code: Locale.current.currency?.identifier ?? "PLN")))")
                        .multilineTextAlignment(.center)
                        .frame(width: 120, height: 50)
                        .background(.yellow).opacity(0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                
                Spacer()
//                .padding()
                
                //this cicrle is going to be replaced by circle diagram
                Circle()
                    .foregroundStyle(.blue).opacity(0.4)
                    .frame(width: 300, height: 300)
                    
                    
                Spacer()
                Spacer()
                
                Button {
                    showingAddExpense = true
                }label:{
                    
                    Text("Add Expense")
                        .font(.largeTitle)
                        .bold()
                        .tint(.white)
                        .frame( maxWidth: .infinity, maxHeight: 100, alignment: .center)
                        .background(.red)
                        .ignoresSafeArea()
                }
                .sheet(isPresented: $showingAddExpense){
                    AddExpenseView(expenses: expensesData)
                }
                .sheet(isPresented: $showingExpensesHistory, content: {
                    ExpensesHistoryView(expenses: expensesData)
                })
                
                
            }
            .navigationTitle("MyExpenses")
        }
    }
}

#Preview {
    ContentView()
}
