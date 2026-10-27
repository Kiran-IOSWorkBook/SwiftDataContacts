//
//  Contact.swift
//  SwiftDataContacts
//
//  Created by Kiran on 21/09/26.
//

import Foundation
import SwiftData

@Model
final class Contact {
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
