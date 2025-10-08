//
//  Deposit.swift
//  Achiever
//
//  Created by Magdaleno A Perez on 10/7/25.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore


struct CreateTaskView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // Your main content goes here
                Spacer()
            }
            .navigationTitle("Create Task")
            .safeAreaInset(edge: .top) {
                VStack {
                    FormView()
                }
                .frame(maxWidth: .infinity)
            }
        }
        
    }
}


private struct FormView: View {
    @State private var task = ""
    @State private var userNotes: String = "Enter your notes here..."
    @State private var showingAlert = false
    @State private var alertMessage = ""
    let db = Firestore.firestore()

    var body: some View {
        VStack(spacing: 16) {
            // Method 1: Simple border with overlay
            TextField("Create Task", text: $task)
                .textFieldStyle(.plain)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            
            Button("Save Task"){
                Task {
                    await addToDatabase(task: task)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
        }
        .padding()
        .alert("Task Status", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    /**
     Function to add tasks to firestore
     // TODO: playaround with it
     */
    private func addToDatabase(task: String) async {
        //checking to see if the task textfield is empty
        guard !task.isEmpty else {
            await MainActor.run {
                self.alertMessage = "Please enter a task"
                self.showingAlert = true
            }
            return
        }
        
        do {
            //adding user's task to firestore
            let ref = try await db.collection("tasks").addDocument(data: [
                "task": task,
                "userNotes": userNotes,
                "createdAt": Timestamp(date: Date()),
                "completed": false
            ])
            print("Task added with ID: \(ref.documentID)")
            
            // Clear the form and show success message
            await MainActor.run {
                self.task = ""
                self.userNotes = "Enter your notes here..."
                self.alertMessage = "Task saved successfully!"
                self.showingAlert = true
            }
            
        } catch {
            //catching errors if any
            print("Error adding task: \(error)")
            await MainActor.run {
                self.alertMessage = "Error saving task: \(error.localizedDescription)"
                self.showingAlert = true
            }
        }
    }
}



#Preview {
    CreateTaskView()
}
