//
//  Sweet.swift
//  Token1.1
//
//  Created by Isabel on 3/18/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Post {
    let key:String!
    let title:String!
    let content:String!
    let addedByUser:String!
    let itemRef:DatabaseReference?
    var replies = [Reply]()
    
    init (title:String, content:String, addedByUser:String, key:String = "", replies: [Reply] = [] ){
        self.title = title
        self.key = key
        self.content = content
        self.addedByUser = addedByUser
        self.itemRef = nil
    }
    
    init (snapshot:DataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        if let dict = snapshot.value as? NSDictionary, let postTitle = dict["title"] as? String{
            title = postTitle
        }else{
            title = ""
        }
        if let dict = snapshot.value as? NSDictionary, let postContent = dict["content"] as? String {
            content = postContent
        } else {
            content = ""
        }
        
        if let dict = snapshot.value as? NSDictionary, let postUser = dict["addedByUser"] as? String{
            addedByUser = postUser
        }else{
            addedByUser = ""
        }
        if let dict = snapshot.value as? NSDictionary, let postReplies = dict["replies"] as? [Reply]{
            replies = postReplies
        }else{
            replies = []
        }
    }
    func toAnyObject() -> AnyObject{
        return ["title": title, "content":content, "addedByUser": addedByUser , "replies": replies] as NSDictionary
    }
}

struct Reply{
    let key:String!
    let content:String!
    let addedByUser:String!
    let itemRef:DatabaseReference?
    let replies = [Post]()
    
    init (content:String, addedByUser:String, key:String = ""){
        self.key = key
        self.content = content
        self.addedByUser = addedByUser
        self.itemRef = nil
    }
    
    init (snapshot:DataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref

        if let dict = snapshot.value as? NSDictionary, let postContent = dict["content"] as? String {
            content = postContent
        } else {
            content = ""
        }
        
        if let dict = snapshot.value as? NSDictionary, let postUser = dict["addedByUser"] as? String{
            addedByUser = postUser
        }else{
            addedByUser = ""
        }
    }
    func toAnyObject() -> AnyObject{
        return ["content":content, "addedByUser": addedByUser] as NSDictionary
    }
}
