//
//  Place.swift
//  Token1.1
//
//  Created by Isabel on 5/16/18.
//  Copyright © 2018 Isabel. All rights reserved.
//

import Foundation
struct Place : Decodable{
    var html_attributions : [String]
    var result : result
    var status : String
    var distance : Double? = nil
//    var address: String
//    var phoneNumber: String
//    var lat: Int
//    var long: Int
//    var rating: Int
//    var website: String
    
//
//    init(name: String, address: String, phoneNumber: String, lat: Int, long: Int, rating: Int, website: String) {
//        self.name = name
//        self.address = address
//        self.phoneNumber = phoneNumber
//        self.lat = lat
//        self.long = long
//        self.rating = rating
//        self.website = website
//    }
    
//    init(json: [String: Any]){
//        name = json["name"] as? String ?? ""
//    }
    
}
struct location: Decodable{
    var lat : Double
    var lng : Double
}
struct viewport: Decodable{
    var northeast: location
    var southwest: location
}
struct geometry: Decodable{
    var location: location
    var viewport: viewport
    
}
struct addressComponent: Decodable{
    var long_name : String
    var short_name : String
    var types : [ String]
}
struct result : Decodable{
    var address_components : [addressComponent]
    var adr_address : String
    var formatted_address : String
    var formatted_phone_number : String
    var geometry : geometry
    var icon : String
    var id : String
    var international_phone_number : String
    var name : String
    var place_id : String
    var rating : Double
    var reference : String
    var reviews : [review]
    var scope : String
    var types : [String]
    var url : String
    var utc_offset : Int
    var vicinity : String
    var website : String
}
struct review: Decodable{
    var author_name : String
    var author_url : String
    var language : String
    var profile_photo_url : String
    var rating : Double
    var relative_time_description : String
    var text : String
    var time : Int
}





