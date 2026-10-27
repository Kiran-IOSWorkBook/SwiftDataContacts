//
//  EditContactView.swift
//  SwiftDataContacts
//
//  Created by Kiran on 21/09/26.
//

import SwiftUI
import SwiftData

struct EditContactView: View {
    @Bindable var contact: Contact

    var body: some View {
        Form {
            
            Section("Contact information") {
                
                TextField("Name", text: $contact.name)
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
        }.navigationTitle("Edit Contact")
    }
}

//#Preview {
//    EditContactView()
//}
