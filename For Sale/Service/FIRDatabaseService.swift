//
//  FIRDatabaseService.swift
//  For Sale
//
//  Created by Ben Aaron on 12-23-17.
//  Copyright © 2017 Ben Aaron. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

enum FIRDatabaseReference: String {
    case products = "products"
}

class FIRDatabaseService {
    
    private init() {}
    static let shared = FIRDatabaseService()
    
    func reference(_ databaseReference: FIRDatabaseReference) -> DatabaseReference {
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    func observe(_ databaseReference: FIRDatabaseReference, completion: @escaping (DataSnapshot) -> Void) {
        reference(databaseReference).observe(.value) { (snapshot) in
            completion(snapshot)
        }
    }
    
    func post(paramaters: [String: Any], to databaseReference: FIRDatabaseReference) {
        reference(databaseReference).childByAutoId().setValue(paramaters)
    }
}
