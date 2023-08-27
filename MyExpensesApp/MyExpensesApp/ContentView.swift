//
//  ContentView.swift
//  MyExpensesApp
//
//  Created by Arkadiusz Młynarczyk on 26/08/2023.
//

import SwiftUI



struct ContentView: View {
    @State private var stan_konta = 0.0
    @State private var wydatki = 0.0
    @State private var wplywy = 0.0
    var body: some View {
        NavigationView {
            
            VStack{
                Spacer()
                HStack(spacing: 20) {
                    
                    Text("Stan Konta\n\(stan_konta.formatted(.number)) zł")
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 50)
                        .background(.green).opacity(0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text("Wydatki\n\(wydatki.formatted(.number)) zł")
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 50)
                        .background(.red).opacity(0.8)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text("Wpływy\n\(wplywy.formatted(.number)) zł")
                        .multilineTextAlignment(.center)
                        .frame(width: 100, height: 50)
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
                    // some code
                }label:{
                    
                    Text("Dodaj wydatek")
                        .font(.largeTitle)
                        .tint(.white)
                        .frame( maxWidth: .infinity, maxHeight: 100, alignment: .center)
                        .background(.red)
                        
//                        .clipShape(RoundedRectangle(cornerRadius: 10))

                        .ignoresSafeArea()
                }
                
                
                
            }
            .navigationTitle("MyEspenses")
        }
    }
}

#Preview {
    ContentView()
}
