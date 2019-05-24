//
//  FileSystem.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit

class FileSystem: NSObject {
    
    static func readJSON(from fileName: String) -> Any? {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                return nil
            }
        }
        
        return json
    }
    
}
