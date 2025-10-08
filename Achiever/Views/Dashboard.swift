//
//  Dashboard.swift
//  Achiever
//
//  Created by Magdaleno A Perez on 9/30/25.
//

import SwiftUI
import FirebaseAuth

struct DashboardView: View {
    @State private var name = Auth.auth().currentUser?.email ?? "User"
    @State private var showDeposit = false
    @State private var showWithdraw = false
    @State private var showStatements = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Welcome, \(name)")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Grid(alignment: .center) {
                    GridRow {
                        Button("Deposit") {
                            showDeposit = true
                        }
                        
                        Button("Withdraw") {
                            showWithdraw = true
                        }
                        Button("Statements"){
                            showStatements = true
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
                    .padding(.top, 24)
                }
                    
                    
                
                Spacer()
            }
            .navigationTitle("Dashboard")
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $showDeposit) {
                DepositView()
            }
            .navigationDestination(isPresented: $showWithdraw) {
//                Withdraw()
            }
            .navigationDestination(isPresented: $showStatements) {
//                Statements()
            }
            .padding(.top, 4)
            .padding(.horizontal)
        }
        
    }
}


#Preview {
    DashboardView()
}
