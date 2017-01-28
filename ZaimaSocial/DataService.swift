//
//  DataService.swift
//  ZaimaSocial
//
//  Created by Ahmed Zaima on 28/01/2017.
//  Copyright © 2017 Ahmed Zaima. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: FIRDatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: FIRDatabaseReference {
        return _REF_USERS
    }
    
    func createFireBaseDBUser(uid: String, userData: Dictionary<String,String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
