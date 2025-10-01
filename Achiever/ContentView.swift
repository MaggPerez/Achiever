//
//  ContentView.swift
//  Achiever
//
//  Created by Magdaleno A Perez on 9/30/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
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
                    
                
                //Email and password
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                                        
                    
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
    // TODO: Implement sign in functionality
    print("Sign in tapped")
}



/**
 Register View
 */
struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToDashboard = false
    @State private var showAlert = false
    @State private var showAlertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "book.closed")
                .imageScale(.large)
            
            Text("Create an account!")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(spacing: 16) {
                TextField("Create email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Create password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button("Register") {
                    registerUser(email: email, password: password)
                }
                .buttonStyle(.borderedProminent)
            }
            
        }
        .padding()
        .navigationDestination(isPresented: $navigateToDashboard) {
            DashboardView()
        }
        .alert("Error in registering", isPresented: $showAlert) {
            Button("Ok", role: .cancel) { }
        } message: {
            Text(showAlertMessage)
        }
    }
    
    
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Something went wrong! Let's find out what.
                print("Error creating user: \(error.localizedDescription)")
                
                // You can cast the error to AuthErrorCode for more specific handling
                if let authError = error as? AuthErrorCode {
                    switch authError.code {
                    case .weakPassword:
                        print("The password is too weak. Please choose a stronger one.")
                    case .invalidEmail:
                        print("The email address is not valid.")
                    case .emailAlreadyInUse:
                        print("An account with this email already exists.")
                    case .operationNotAllowed:
                        print("Email/Password sign-in is not enabled for this project.")
                    default:
                        print("Unhandled Firebase Auth error: \(authError.localizedDescription)")
                    }
                }
                // Set the alert message and show the alert
                showAlertMessage = error.localizedDescription
                showAlert = true
                
            } else {
                // Success! The user is created and signed in.
                print("User created successfully!")
                if let user = authResult?.user {
                    print("Signed in user ID: \(user.uid)")
                    // Navigate to your main app content or perform further actions
                    navigateToDashboard = true
                }
            }
        }
        
    }
    
}
    
    #Preview {
        ContentView()
    }
    

