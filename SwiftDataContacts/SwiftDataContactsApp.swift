//
//  SwiftDataContactsApp.swift
//  SwiftDataContacts
//
//  Created by Kiran on 21/09/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataContactsApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            ContactListView()
        }.modelContainer(for: Contact.self)
    }
}
