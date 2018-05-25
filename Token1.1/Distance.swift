//
//  Distance.swift
//  Token1.1
//
//  Created by Isabel on 5/18/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import Foundation

struct row : Decodable{
    var elements : [element]
}
struct element : Decodable{
    var status : String
    var duration : duration
    var distance : distance
    
}
struct duration : Decodable{
    var value : Int
    var text : String
}
struct distance : Decodable{
    var value : Int
    var text : String
}
struct distanceData : Decodable{

    var status : String
    var origin_addresses : [String]
    var destination_addresses : [String]
    var rows : [ row]
}
