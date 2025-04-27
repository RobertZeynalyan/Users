//
//  Name.swift
//  Users
//
//  Created by Robert on 28.04.25.
//

struct Name: Hashable, Equatable, Codable {
    let title: String
    let first: String
    let last:String
    var fullName: String {
        return "\(title) \(first) \(last)"
    }
}
