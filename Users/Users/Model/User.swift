//
//  User.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

enum Gender {
    case male = "Male"
    case female = "Female"
}
struct UserModel {
    
    var profileImage: UIImage
    var name: String
    var lastName: String
    var fullName : String {
        return "\(name) \(lastName)"
    }
    var phoneNumber: String
    var country: String
    var adress: String
}
