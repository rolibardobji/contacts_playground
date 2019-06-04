//
//  Storage.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RealmSwift

class Storage: NSObject {
    let test = "Testing forced push effects with diverging testing1"
    
    static func store<T>(objects: [T]) {
        guard let realmObjects = objects as? [Object] else {
            return
        }
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObjects, update: true)
        }
    }
    
    static func remove<T>(object: T) {
        guard let realmObject = object as? Object else {
            return
        }
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realmObject)
        }
    }
    
    static func update<T>(object: T) {
        guard let realmObject = object as? Object else {
            return
        }
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject, update: true)
        }
    }
    
    static func contacts() -> [Contact] {
        let realm = try! Realm()
        let contacts = realm.objects(Contact.self)
        return Array(contacts)
    }
    
}
