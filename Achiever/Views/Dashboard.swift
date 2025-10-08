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
    @State private var showCreateTask = false
    @State private var showViewTask = false
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("Welcome, \(name)")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                Grid(alignment: .center) {
                    GridRow {
                        Button("Create Task") {
                            showCreateTask = true
                        }
                        
                        Button("View Tasks") {
                            showViewTask = true
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
            .navigationDestination(isPresented: $showCreateTask) {
                CreateTaskView()
            }
            .navigationDestination(isPresented: $showViewTask) {
//                Withdraw()
            }
            .padding(.top, 4)
            .padding(.horizontal)
        }
        
    }
}


#Preview {
    DashboardView()
}
