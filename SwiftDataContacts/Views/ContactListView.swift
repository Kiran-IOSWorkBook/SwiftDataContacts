//
//  ContactListView.swift
//  SwiftDataContacts
//
//  Created by Kiran on 21/09/26.
//

import SwiftUI
import SwiftData

struct ContactListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var contacts: [Contact]
    @State private var showAddContact = false
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach (contacts) { contact in
                    NavigationLink {
                        EditContactView(contact: contact)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(contact.name)
                                .font(.headline)
                            
                            Text(contact.email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }.onDelete(perform: deleteContacts)
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddContact = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddContact) {
                AddContactView()
            }
        }
    }
    
    private func deleteContacts(at offsets: IndexSet) {
        
        for index in offsets {
            let contact = contacts[index]
            modelContext.delete(contact)
        }
        
    }
}

#Preview {
    ContactListView()
}
