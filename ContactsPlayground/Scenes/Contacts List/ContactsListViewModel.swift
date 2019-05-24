//
//  ContactsListViewModel.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RxSwift

class ContactsListViewModel: NSObject {

    var contacts: BehaviorSubject<[Contact]> = BehaviorSubject(value: [])
    private var file: String
    
    init(contactsFile: String) {
        file = contactsFile
    }
    
    private func loadContactsFromStore() {
        contacts.onNext(Storage.contacts())
    }
    
    private func contactsFirstLoad(from file: String) {
        guard let contactsJSON = FileSystem.readJSON(from: file) as? [[String : Any]] else {
            return
        }
        
        let contacts = self.contacts(from: contactsJSON)
        storeContacts(contacts: contacts)
    }
    
    private func storeContacts(contacts: [Contact]) {
        Storage.store(objects: contacts)
    }
    
    private func contacts(from json: [[String : Any]]) -> [Contact] {
        // Could've used Codable for Contacts parsing from JSON,
        // but I'm really not sure how that plays with Realm objects
        
        var contacts: [Contact] = []
        
        for entity in json {
            // Using forced unwrapping since I'm assuming all values to never be NSNull
            let identifier = entity["id"] as! String
            let firstName = entity["first_name"] as! String
            let lastName = entity["last_name"] as! String
            let phone = entity["phone"] as! String
            let address1 = entity["address_1"] as! String
            let address2 = entity["address_2"] as! String
            let city = entity["city"] as! String
            let state = entity["state"] as! String
            let zipCode = entity["zip_code"] as! String
            
            let contact = Contact()
            
            contact.identifier = identifier
            contact.firstName = firstName
            contact.lastName = lastName
            contact.phone = phone
            contact.address1 = address1
            contact.address2 = address2
            contact.city = city
            contact.state = state
            contact.zipCode = zipCode
            
            contacts.append(contact)
        }
        
        return contacts
    }
    
    func start() {
        contactsFirstLoad(from: file)
        loadContactsFromStore()
    }
    
    func update() {
        loadContactsFromStore()
    }
    
    func contact(at index: Int) -> Contact? {
        do {
            return try contacts.value()[index]
        }
        catch {
            return nil
        }
    }
    
}
