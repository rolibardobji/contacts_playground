//
//  Contact.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RealmSwift

class Contact: Object {
    @objc dynamic var identifier = ""
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var phone = ""
    @objc dynamic var address1 = ""
    @objc dynamic var address2 = ""
    @objc dynamic var city = ""
    @objc dynamic var state = ""
    @objc dynamic var zipCode = ""
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
}
