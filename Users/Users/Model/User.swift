//
//  User.swift
//  Users
//
//  Created by Robert on 22.04.25.
//

import SwiftUI

struct User: Hashable, Equatable, Codable {
    let gender: String
    let name: Name
    let location: USLocation
    let street: Street
    let coordinates: Coordinates
    let timezone: USTimeZone
    let email: String
    let login: Login
    let dob: Dob
    let registered: Dob
    let phone: String
    let cell: String
    let id: USId
    let picture: Picture
    let nat: String
    var isSaved: Bool = false
}
