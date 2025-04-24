//
//  User.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

enum Gender: String, CaseIterable, Codable {
    case male = "Male"
    case female = "Female"
}

struct User: Codable, Hashable, CustomStringConvertible {
    var description: String
    
    var id: String
    var profileImage: String
    var name: String
    var lastName: String
    var fullName : String {
        return "\(name) \(lastName)"
    }
    var phoneNumber: String
    var country: String
    var adress: String
    var gender: Gender
    var isSaved: Bool
    
    init (
    id: String,
    description: String,
    profileImage: String,
    name: String,
    lastName: String,
    phoneNumber: String,
    country: String,
    adress: String,
    gender: Gender,
    isSaved: Bool ) {
        
        self.id = id
        self.description = description
        self.profileImage = profileImage
        self.name = name
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.country = country
        self.adress = adress
        self.gender = gender
        self.isSaved = isSaved
    }
    
}
