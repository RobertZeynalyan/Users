//
//  Login.swift
//  Users
//
//  Created by Robert on 28.04.25.
//

struct Login: Hashable, Equatable, Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}
