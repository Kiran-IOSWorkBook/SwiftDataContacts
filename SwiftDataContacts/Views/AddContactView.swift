//
//  AddContactView.swift
//  SwiftDataContacts
//
//  Created by Kiran on 21/09/26.
//

import SwiftUI
import SwiftData

struct AddContactView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var email = ""
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Contact information") {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
                
                Button("Save") {
                    saveContact()
                }
                .disabled(
                    name.trimmingCharacters(in: .whitespaces).isEmpty ||
                    email.trimmingCharacters(in: .whitespaces).isEmpty
                )
            }
            .navigationTitle("Add Contact")
        }
    }
    
    private func saveContact() {
        let contact = Contact(name: name, email: email)
        modelContext.insert(contact)
        dismiss()
    }
}

#Preview {
    AddContactView()
}
