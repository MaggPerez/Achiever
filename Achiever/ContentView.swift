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
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "book.closed")
                    .imageScale(.large)
                Text("Welcome to Achiever")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Enter your email and password to sign in")
                    
                
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
            
            HStack {
                Text("Don't have an account?")
                NavigationLink("Create One") {
                    RegisterView()
                }
            }
        }
    }
}

func signIn() {
    
}

func register(username: String, password: String) {
    if(!username.isEmpty && !password.isEmpty){
        
    }
}

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var navigateToDashboard = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "book.closed")
                .imageScale(.large)
                
            Text("Create an account!")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                TextField("Create username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Create password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Register") {
                    registerUser()
                }
                .buttonStyle(.borderedProminent)
            }
            
        }
        .navigationDestination(isPresented: $navigateToDashboard) {
            DashboardView()
        }
    }
    
    private func registerUser() {
        if !username.isEmpty && !password.isEmpty {
            // Perform registration logic here
            // For example, you might call an API or save to a database
            
            // If registration is successful, navigate to dashboard
            navigateToDashboard = true
        }
    }
}



#Preview {
    ContentView()
}

