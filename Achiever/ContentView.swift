//
//  ContentView.swift
//  Achiever
//
//  Created by Magdaleno A Perez on 9/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image(systemName: "book.closed")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to Achiever")
                .font(.title)
                .fontWeight(.bold)
                
            
            VStack(spacing: 16) {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Sign In", action: signIn)
                    .buttonStyle(.borderedProminent)
            }
            
        }
        .padding()
    }
}

func signIn() {
    
}

func register() {
    
}

#Preview {
    ContentView()
}
