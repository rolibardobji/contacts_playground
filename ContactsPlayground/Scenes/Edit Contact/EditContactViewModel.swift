//
//  EditContactViewModel.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RxSwift

class EditContactViewModel: NSObject {
    
    var firstName: BehaviorSubject<String> = BehaviorSubject(value: "")
    var lastName: BehaviorSubject<String> = BehaviorSubject(value: "")
    var phone: BehaviorSubject<String> = BehaviorSubject(value: "")
    var address1: BehaviorSubject<String> = BehaviorSubject(value: "")
    var address2: BehaviorSubject<String> = BehaviorSubject(value: "")
    var city: BehaviorSubject<String> = BehaviorSubject(value: "")
    var state: BehaviorSubject<String> = BehaviorSubject(value: "")
    var zipCode: BehaviorSubject<String> = BehaviorSubject(value: "")
    
    private var contact: Contact?
    
    init(contact: Contact?) {
        self.contact = contact
    }
    
    func start() {
        firstName.onNext(contact?.firstName ?? "")
        lastName.onNext(contact?.lastName ?? "")
        phone.onNext(contact?.phone ?? "")
        address1.onNext(contact?.address1 ?? "")
        address2.onNext(contact?.address2 ?? "")
        city.onNext(contact?.city ?? "")
        state.onNext(contact?.state ?? "")
        zipCode.onNext(contact?.zipCode ?? "")
    }
    
    func save() {
        let contact = Contact()
        contact.identifier = self.contact?.identifier ?? "1"
        do {
            
            try contact.firstName = firstName.value()
            try contact.lastName = lastName.value()
            try contact.phone = phone.value()
            try contact.address1 = address1.value()
            try contact.address2 = address2.value()
            try contact.city = city.value()
            try contact.state = state.value()
            try contact.zipCode = zipCode.value()
            
            Storage.update(object: contact)
        }
        catch {
            return
        }
    }
    
    func remove() {
        Storage.remove(object: contact)
    }
    
}
