//
//  Deposit.swift
//  Achiever
//
//  Created by Magdaleno A Perez on 10/7/25.
//

import SwiftUI

struct DepositView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Your main content goes here
                Spacer()
            }
            .navigationTitle("Deposit")
            .safeAreaInset(edge: .top) {
                VStack {
                    BannerView()
                    TextFieldViews()
                }
                .frame(maxWidth: .infinity)
            }
        }
        
    }
}



private struct BannerView: View {
    @State private var balance = 10
    var body: some View {
        VStack {
            Text("$\(balance)")
            
            Text("Available Balance")
                
        }
        .padding(.vertical, 48)
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(0)
        .foregroundColor(.white)
        .font(.title)
        .fontWeight(.semibold)
    }
}

private struct TextFieldViews: View {
    @State private var userBalance: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter amount", text: $userBalance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            VStack(spacing: 16) {
                Button("Deposit") {
                    
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Withdraw") {
                    
                }
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    DepositView()
}
