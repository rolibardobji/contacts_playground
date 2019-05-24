//
//  NewContactViewModel.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RxSwift

class NewContactViewModel: NSObject {
    
    var firstName: BehaviorSubject<String> = BehaviorSubject(value: "")
    var lastName: BehaviorSubject<String> = BehaviorSubject(value: "")
    var phone: BehaviorSubject<String> = BehaviorSubject(value: "")
    var address1: BehaviorSubject<String> = BehaviorSubject(value: "")
    var address2: BehaviorSubject<String> = BehaviorSubject(value: "")
    var city: BehaviorSubject<String> = BehaviorSubject(value: "")
    var state: BehaviorSubject<String> = BehaviorSubject(value: "")
    var zipCode: BehaviorSubject<String> = BehaviorSubject(value: "")
    
    func save() {
        let contact = Contact()
        contact.identifier = UUID.init().uuidString
        do {
            try contact.firstName = firstName.value()
            try contact.lastName = lastName.value()
            try contact.phone = phone.value()
            try contact.address1 = address1.value()
            try contact.address2 = address2.value()
            try contact.city = city.value()
            try contact.state = state.value()
            try contact.zipCode = zipCode.value()
            
            Storage.store(objects: [contact])
        }
        catch {
            return
        }
    }
}
