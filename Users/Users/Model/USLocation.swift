//
//  USLocation.swift
//  Users
//
//  Created by Robert on 28.04.25.
//

struct USLocation: Hashable, Equatable, Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
}
