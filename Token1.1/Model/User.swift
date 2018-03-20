//
//  User.swift
//  Token1.1
//
//  Created by Isabel on 3/18/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User{
    let uid:String
    let email:String
    
    init(userData:User){
        uid = userData.uid
        
       
        email = userData.email
        
    }
    init (uid:String, email:String){
        self.uid = uid
        self.email = email
    }
}
